#!/usr/bin/perl

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;
use warnings;

use English;
use Carp;
use FindBin;
use File::Copy;
use File::Temp qw/tempdir/;
use File::Spec::Functions qw/tmpdir/;

use Path::Class;

use Getopt::Long;
use Pod::Usage;

use DBI;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

use XML::Twig;
use Graph::Directed;

use Data::Dumper;


######### CONFIG ##########

my @sql_blacklist =
    (
     qr!sequence/gencode/gencode.sql!,
     qr!sequence/bridges/so-bridge.sql!,
     qr!sequence/views/implicit-feature-views.sql!,
    );

my $dump_directory = dir( $FindBin::Bin )->parent->parent->subdir('lib')->stringify;

##########################


## parse and validate command-line options
my $chado_schema_checkout;
my $dsn;
my $chado_checkout_rev;
GetOptions(
           'c|chado-checkout=s' => \$chado_schema_checkout,
           'd|dsn=s'            => \$dsn,
           'r|revision'         => \$chado_checkout_rev,
          )
    or pod2usage(1);

$dsn || pod2usage( -msg => 'must provide a --dsn for a suitable test database');

## check out a new chado schema copy
$chado_schema_checkout ||= check_out_fresh_chado( $chado_checkout_rev || 'HEAD' );
-d $chado_schema_checkout or die "no such dir '$chado_schema_checkout'\n";

# parse the modules definition into a dependency Graph.  dies on error
my $md = parse_chado_module_metadata( $chado_schema_checkout );
#my ($md->{graph},$modules_xml) = parse_chado_module_metadata( $chado_schema_checkout );
#die "$md->{graph}";
$md->{graph}->is_dag or die "cannot resolve module dependencies: $md->{graph}\n";

# check for nonexistent modules in the module metadata
if( my @bad_dependencies = grep !$md->{twigs}->{$_}, $md->{graph}->vertices) {
    warn "dependencies on nonexistent modules/components:\n",map "   $_\n", @bad_dependencies
}

# traverse modules in breadth-first dependency order to find the order
# of loading for chado modules
my @module_load_order;
while( my @root_modules = grep {$md->{graph}->is_successorless_vertex($_)} $md->{graph}->vertices ) {
    unshift @module_load_order, @root_modules;
    $md->{graph}->delete_vertex($_) for @root_modules;
}

warn "made module load order:\n",
    map "  $_\n",@module_load_order;

#go down the modules in load order, extract a list of all the sql files to dump, in order
my @source_files_load_order =
    map {
        my $mod_id = $_;
        my $twig = $md->{twigs}->{$mod_id};
        #get the source file paths
        my @sources = map { $_->att('path') }
            $twig->descendants(q|source[@type='sql']|);

        #add the directories to the source file paths
        [ $mod_id,
          grep {my $s=$_; !(grep {$s =~ $_} @sql_blacklist)}
          map { file( $chado_schema_checkout,
                      ($md->{modules_dir} || ()),
                      $_
                    )->stringify
               } @sources
        ]
    } @module_load_order;


# warn about any missing source files
if( my @missing_sources = map { my @f = @$_; shift @f; grep !-f, @f } @source_files_load_order ) {
    warn "missing source files:\n", map "   $_\n", @missing_sources;
}

warn "loading module sources:\n";
foreach my $src (@source_files_load_order) {
    my ($modname,@files) = @$src;
    warn "  $modname:\n";
    foreach my $f (@files) {
        $f =~ s/$chado_schema_checkout//;
        warn "     $f\n";
    }
}

# # connect to our db
my $dbh = DBI->connect( $dsn, undef, undef, {RaiseError => 1} );

# # drop all tables from the target database
eval{ local $dbh->{Warn} = 0;  $dbh->do('DROP SCHEMA public CASCADE') };
$dbh->do('CREATE SCHEMA public');
$dbh->do('SET search_path=public');

my %db_object_module_membership; #< hash of table/view name => module name
foreach my $module ( @source_files_load_order ) {

    my @before = list_db_objects( $dbh );

    # load the module into the test database
    load_sql( $dbh, $module );

    my @after  = list_db_objects( $dbh );

    # find what tables and views are new
    my @new = objects_diff( \@before, \@after );
    s/^[^\.]+\.// for @new;

    warn "$module->[0]: new db objects:\n",
        map "  $_\n",@new;

    # record their names in the hash of name => module name
    my $mod_moniker = join '', map ucfirst, split /[\W_]+/, lc $module->[0];

    foreach my $new_obj (@new) {

        $db_object_module_membership{$new_obj}
            and die "sanity check failed, found '$new_obj' as a new object for a second time??!";

        $db_object_module_membership{$new_obj} = $mod_moniker
    }
}

# do a make_schema_at, restricted to the new set of tables and views,
#     dumping to Bio::Chado::Schema::ModuleName::ViewOrTableName

make_schema_at(
               'Bio::Chado::Schema',
               { dump_directory => $dump_directory,
                 moniker_map => sub {
                     my $table = shift;
                     my $table_moniker = join '', map ucfirst, split /[\W_]+/, $table;

                     my $module_moniker = $db_object_module_membership{$table}
                         or die "could not find module membership for '$table'";

                     $module_moniker.'::'.$table_moniker;
                 }, #< do not try to inflect to singular
               },
               [$dsn,undef,undef],
              );


# given a dbh and a module source file record, load it into the given
# dbh
sub load_sql {
    my ($dbh, $module_record) = @_;
    my ($module_name,@source_files) = @$module_record;

    foreach my $f (@source_files) {
        warn "loading $f\n";
        open my $s, '<', $f or die "$! opening $f\n";
        local $INPUT_RECORD_SEPARATOR;
        my $sql = <$s>;
        local $dbh->{Warn} = 0;
        $dbh->do( $sql );
    }
}

# given a dbh, list all of the objects in it that might be interesting
# to DBIx::Class::Schema::Loader
sub list_db_objects {
    my ($dbh) = @_;

    #right now, this only works with postgres
    my @tables_and_views = $dbh->tables( undef, 'public' );
    return @tables_and_views;
}

# given two lists of objects, return a list of the objects that were
# added in the second one
sub objects_diff {
    my ($before,$after) = @_;

    my %b = map {$_ => 1} @$before;
    return grep !$b{$_}, @$after;
}

############# SUBROUTINES ############

# check out schema/chado into a tempdir, return the name of the dir
sub check_out_fresh_chado {
    my $chado_version = shift;
    my $tempdir = tempdir(dir(tmpdir(),'update-dbic-dump-XXXXXX')->stringify, CLEANUP => 1);
    system "cd $tempdir && cvs -d:pserver:anonymous\@gmod.cvs.sourceforge.net:/cvsroot/gmod login && cvs -z9 -d:pserver:anonymous\@gmod.cvs.sourceforge.net:/cvsroot/gmod export -r $chado_version schema/chado/modules && cvs -z9 -d:pserver:anonymous\@gmod.cvs.sourceforge.net:/cvsroot/gmod export -r $chado_version schema/chado/chado-module-metadata.xml";
    $CHILD_ERROR and die "cvs checkout failed";

    return dir( $tempdir, 'schema', 'chado' )->stringify;
}


# given chado module metadata dir, parses the module metadata file and
# returns a Graph of it, with nodes being schema modules and
# directional edges being the dependencies between them
# (directionality is: module1 --DEPENDS-ON--> module2 )
sub parse_chado_module_metadata {
    #my $md_filename = 'foo.xml';
    my $md_filename = 'chado-module-metadata.xml';
    my $metadata_file = file( shift || die, $md_filename );
    -r $metadata_file or die "could not read $md_filename";

    ## load it into a Graph::Directed object
    my $graph = Graph::Directed->new();

    #parse the module metadata file
    my %module_twigs;
    my $p = XML::Twig->new();
    $p->parsefile( $metadata_file->stringify );

    #extract the modules subdir
    my ($modules_dir) = $p->descendants(q"source[@type='dir']");
    $modules_dir &&= $modules_dir->att('path');

    my %comp_to_modname;
    foreach my $module ($p->descendants('module')) {
        my $mod_id = $module->att('id')
            or die "<module> element with no id\n";
        $comp_to_modname{$mod_id} = $mod_id;
        $comp_to_modname{$_} = $mod_id
            foreach map $_->att('id'), $module->descendants('component');
    }
    foreach my $module ($p->descendants('module')) {
        my $mod_id = $module->att('id')
            or die "<module> element with no id\n";
        $module_twigs{$mod_id} = $module;
        $graph->add_vertex($mod_id);

        # extract all the dependency "to" ids and add graph edges for them
        foreach my $dep_id ( map {$_->att('to') or die "no 'to' in dependency"}
                             $module->descendants('dependency')
                           ) {
            my $dep_mod_id = $comp_to_modname{$dep_id};
            unless( $dep_mod_id ) {
                warn "WARNING: component/module '$dep_id' does not exist!  ignoring dependency.\n";
                next;
            }
            next if $dep_mod_id eq $mod_id; #< modules need not depend on themselves
            $graph->add_edge($dep_mod_id,$mod_id);
        }
    }

    return { graph => $graph, twigs => \%module_twigs, modules_dir => $modules_dir };
}


__END__

=head1 NAME

update_dbic_dump.pl - script to sync the DBIx::Class object layer with
the current set of chado tables

=head1 DESCRIPTION

This script basically:

  - checks out a clean chado schema copy (unless you pass --chado-checkout=)
  - drops all tables from the target database
  - parses the chado module metadata
  - uses DBIx::Class::Schema::Loader::make_schema_at() to update the
    dumped modules in lib/ with any schema changes

=head1 SYNOPSIS

  update_dbic_dump.pl [options]

  Options:

    -r <rev>
    --revision=<rev>
       chado CVS revision to use.  Default HEAD.

    -d <dsn>
    --dsn=<dsn>
       DBI dsn of an empty database to use as temp storage for loading
       and dumping.  WILL DELETE THIS ENTIRE DATABASE.  Note that the
       user name and password used to connect to the database also
       goes here.
       Example:
        -d 'dbi:Pg:dbname=cxgn;host=localhost;user=somebody;password=something'

    -c <dir>
    --chado-checkout=<dir>
       optional path to existing chado checkout to use.  if passed,
       will not check out a new copy from CVS.

=head1 MAINTAINER

Robert Buels, E<lt>rmb32@cornell.eduE<gt>

=head1 AUTHOR

Robert Buels, E<lt>rmb32@cornell.eduE<gt>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Boyce Thompson Institute for Plant Research

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
