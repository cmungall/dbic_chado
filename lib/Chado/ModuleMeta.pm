package Chado::ModuleMeta;
use strict;
use warnings;
use Moose;

use Carp;

use XML::Twig;


has 'module_basedir',
    ( is => 'ro',
      isa => 'Path::Class::Dir',
      
    );

=head1 NAME

Chado::ModuleMeta - work with chado module metadata and DDL

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 BASE CLASS(ES)

=head1 SUBCLASSES

=head1 METHODS

=cut

=head2 parse_metadata

  Usage: $handle->parse_metadata();
  Desc : 
  Args :
  Ret  :
  Side Effects:
  Example:

=cut

# given chado module metadata dir, parses the module metadata file and
# returns a Graph of it, with nodes being schema modules and
# directional edges being the dependencies between them
# (directionality is: module1 --DEPENDS-ON--> module2 )
sub parse_chado_module_metadata {
    #my $md_filename = 'foo.xml';
    my $md_filename = 'chado-module-metadata.xml';
    my $metadata_file = file( $self->module_basedir || die, $md_filename );
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


=head1 MAINTAINER

Robert Buels

=head1 AUTHOR

Robert Buels, E<lt>rmb32@cornell.eduE<gt>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Boyce Thompson Institute for Plant Research

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;
no Moose;
1;

