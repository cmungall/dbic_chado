package Bio::Chado::Schema::Mage::Acquisition;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Acquisition

=head1 DESCRIPTION

This represents the scanning of hybridized material. The output of this process is typically a digital image of an array.

=cut

__PACKAGE__->table("acquisition");

=head1 ACCESSORS

=head2 acquisition_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'acquisition_acquisition_id_seq'

=head2 assay_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 channel_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 acquisitiondate

  data_type: 'timestamp without time zone'
  default_value: CURRENT_TIMESTAMP
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 uri

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "acquisition_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "acquisition_acquisition_id_seq",
  },
  "assay_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "channel_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "acquisitiondate",
  {
    data_type     => "timestamp without time zone",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable   => 1,
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "uri",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("acquisition_id");
__PACKAGE__->add_unique_constraint("acquisition_c1", ["name"]);

=head1 RELATIONS

=head2 protocol

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Protocol>

=cut

__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 assay

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Assay>

=cut

__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 channel

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Channel>

=cut

__PACKAGE__->belongs_to(
  "channel",
  "Bio::Chado::Schema::Mage::Channel",
  { channel_id => "channel_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 acquisitionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Acquisitionprop>

=cut

__PACKAGE__->has_many(
  "acquisitionprops",
  "Bio::Chado::Schema::Mage::Acquisitionprop",
  { "foreign.acquisition_id" => "self.acquisition_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 acquisition_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::AcquisitionRelationship>

=cut

__PACKAGE__->has_many(
  "acquisition_relationship_subjects",
  "Bio::Chado::Schema::Mage::AcquisitionRelationship",
  { "foreign.subject_id" => "self.acquisition_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 acquisition_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::AcquisitionRelationship>

=cut

__PACKAGE__->has_many(
  "acquisition_relationship_objects",
  "Bio::Chado::Schema::Mage::AcquisitionRelationship",
  { "foreign.object_id" => "self.acquisition_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 quantifications

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Quantification>

=cut

__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Mage::Quantification",
  { "foreign.acquisition_id" => "self.acquisition_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 15:58:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XAX5ZXwoY66OpqtbUAZHHA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
