package Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol

=head1 DESCRIPTION

A protocol can be anything that is done as part of the experiment.

=cut

__PACKAGE__->table("nd_protocol");

=head1 ACCESSORS

=head2 nd_protocol_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_protocol_nd_protocol_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

The protocol name.

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 description

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "nd_protocol_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_protocol_nd_protocol_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "description",
  {
    data_type     => "varchar",
    default_value => \"null",
    is_nullable   => 1,
    size          => 255,
  },

);

__PACKAGE__->set_primary_key("nd_protocol_id");
__PACKAGE__->add_unique_constraint("nd_protocol_name_key", ["name"]);

=head1 RELATIONS

=head2 nd_experiment_protocols

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProtocol>

=cut

__PACKAGE__->has_many(
  "nd_experiment_protocols",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProtocol",
  { "foreign.nd_protocol_id" => "self.nd_protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 nd_protocolprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolprop>

=cut

__PACKAGE__->has_many(
  "nd_protocolprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolprop",
  { "foreign.nd_protocol_id" => "self.nd_protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_protocol_reagents

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent>

=cut

__PACKAGE__->has_many(
  "nd_protocol_reagents",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent",
  { "foreign.nd_protocol_id" => "self.nd_protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-09-22 08:45:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/s5ivY/IbdQpirevdhAGuw


# You can replace this text with custom content, and it will be preserved on regeneration

=head2 create_nd_protocolprops

  Usage: $set->create_nd_protocolprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create protocol properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given protocolprop name.  Default false.

            cv_name => cv.name to use for the given protocolprops.
                       Defaults to 'nd_protocol_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

             rank => force numeric rank. Be careful not to pass ranks that already exist
                     for the property type. The function will die in such case.

             allow_duplicate_values => default false.
                If true, allow duplicate instances of the same protocol
                and types in the properties of the protocol.  Duplicate
                types will have different ranks.
          }
  Ret  : hashref of { propname => new nd_protocolprop object }

=cut

sub create_nd_protocolprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts->{cv_name} = 'nd_protocol_property'
        unless defined $opts->{cv_name};
    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'nd_protocolprops',
        );
}


1;
