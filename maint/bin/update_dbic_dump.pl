#!/usr/bin/perl

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;
use warnings;

use English;
use Carp;
use FindBin;

use Path::Class;

use Getopt::Long;
use Pod::Usage;

use DBI;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

use Config::Any;
use Graph::Directed;

use Data::Dumper;


## parse and validate command-line options
my $chado_schema_checkout;
my $dsn;
GetOptions(
           'c|chado-checkout=s' => \$chado_schema_checkout,
           'd|dsn=s'            => \$dsn,
          )
    or pod2usage(1);

#$dsn || pod2usage( -msg => 'must provide a --dsn for a suitable test database');

## check out a new chado schema copy
$chado_schema_checkout ||= check_out_fresh_chado();
-d $chado_schema_checkout or die "no such dir '$chado_schema_checkout'\n";

# parse the modules definition into a dependency Graph.  dies on error
my $chado_modules = parse_chado_module_metadata( $chado_schema_checkout );

# connect to our db
my $dbh = DBI->connect( $dsn );

# drop all tables from the target database
$dbh->do('DROP SCHEMA public CASCADE');

# traverse modules in breadth-first dependency order


#   list the current set of tables and views
#   load the module into the database
#   find what tables and views are new
#   do a make_schema_at, restricted to the new set of tables and views,
#       dumping to Chado::Schema::ModuleName::ViewOrTableName






############# SUBROUTINES ############

# check out schema/chado into a tempdir, return the name of the dir
sub check_out_fresh_chado {
    # takes no params
    die 'need to implement '.(caller(0))[3];
}


# given chado module metadata dir, parses the module metadata file and
# returns a Graph of it, with nodes being schema modules and direction
# edges being the dependencies between them
sub parse_chado_module_metadata {
    my $md_filename = 'chado-module-metadata.xml';
    my $metadata_file = file( shift || die, $md_filename );
    -r $metadata_file or die "could not read $md_filename";

    #parse the module metadata file
    my $p = Config::Any->load_files({files => [$metadata_file]});
    #die Dumper $p;

    ## load it into a Graph::Directed object
    my $graph = Graph::Directed->new;
    # TODO: make the vertices and edges

    return $graph;
}



__END__

=head1 NAME

update_dbic_dump.pl - script to sync the DBIx::Class object layer with
the current set of chado tables

=head1 DESCRIPTION

This script basically:

  - check out a clean chado schema copy
  - drop all tables from the target database
  - make and install it with all modules
  - do a make_schema_at on it to refresh modules

=head1 SYNOPSIS

  update_dbic_dump.pl [options] chado_version

  Options:

    --dsn=<dsn>

    --chado-schema-checkout=<dir>

=head1 MAINTAINER

Robert Buels

=head1 AUTHOR

Robert Buels, E<lt>rmb32@cornell.eduE<gt>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Boyce Thompson Institute for Plant Research

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
