package Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent

=cut

__PACKAGE__->table("nd_protocol_reagent");

=head1 ACCESSORS

=head2 nd_protocol_reagent_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_protocol_reagent_nd_protocol_reagent_id_seq'

=head2 nd_protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 reagent_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "nd_protocol_reagent_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_protocol_reagent_nd_protocol_reagent_id_seq",
  },
  "nd_protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "reagent_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_protocol_reagent_id");

=head1 RELATIONS

=head2 nd_protocol

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol>

=cut

__PACKAGE__->belongs_to(
  "nd_protocol",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol",
  { nd_protocol_id => "nd_protocol_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 reagent

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdReagent>

=cut

__PACKAGE__->belongs_to(
  "reagent",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdReagent",
  { nd_reagent_id => "reagent_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
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


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XRNPt3GMf5ZZ52xyoCITjg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
