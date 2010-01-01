package Bio::Chado::Schema::Mage::Quantification;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Quantification - Quantification is the transformation of an image acquisition to numeric data. This typically involves statistical procedures.

=cut

__PACKAGE__->table("quantification");

=head1 ACCESSORS

=head2 quantification_id

  data_type: integer
  default_value: nextval('quantification_quantification_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 acquisition_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 operator_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

=head2 protocol_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

=head2 analysis_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 quantificationdate

  data_type: timestamp without time zone
  default_value: now()
  is_nullable: 1
  size: 8

=head2 name

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 uri

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=cut

__PACKAGE__->add_columns(
  "quantification_id",
  {
    data_type => "integer",
    default_value => "nextval('quantification_quantification_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "acquisition_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "operator_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "protocol_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "analysis_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "quantificationdate",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 1,
    size => 8,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "uri",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("quantification_id");
__PACKAGE__->add_unique_constraint("quantification_c1", ["name", "analysis_id"]);

=head1 RELATIONS

=head2 elementresults

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Elementresult>

=cut

__PACKAGE__->has_many(
  "elementresults",
  "Bio::Chado::Schema::Mage::Elementresult",
  { "foreign.quantification_id" => "self.quantification_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 operator

Type: belongs_to

Related object: L<Bio::Chado::Schema::Contact::Contact>

=cut

__PACKAGE__->belongs_to(
  "operator",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "operator_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 analysis

Type: belongs_to

Related object: L<Bio::Chado::Schema::Companalysis::Analysis>

=cut

__PACKAGE__->belongs_to(
  "analysis",
  "Bio::Chado::Schema::Companalysis::Analysis",
  { analysis_id => "analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 protocol

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Protocol>

=cut

__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 acquisition

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Acquisition>

=cut

__PACKAGE__->belongs_to(
  "acquisition",
  "Bio::Chado::Schema::Mage::Acquisition",
  { acquisition_id => "acquisition_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 quantificationprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Quantificationprop>

=cut

__PACKAGE__->has_many(
  "quantificationprops",
  "Bio::Chado::Schema::Mage::Quantificationprop",
  { "foreign.quantification_id" => "self.quantification_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 quantification_relationship_subject_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::QuantificationRelationship>

=cut

__PACKAGE__->has_many(
  "quantification_relationship_subject_ids",
  "Bio::Chado::Schema::Mage::QuantificationRelationship",
  { "foreign.subject_id" => "self.quantification_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 quantification_relationship_object_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::QuantificationRelationship>

=cut

__PACKAGE__->has_many(
  "quantification_relationship_object_ids",
  "Bio::Chado::Schema::Mage::QuantificationRelationship",
  { "foreign.object_id" => "self.quantification_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:90kWOXdclnSxYwQ1mdTVrQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
