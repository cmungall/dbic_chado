package Bio::Chado::Schema::Mage::Element;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Element

=head1 DESCRIPTION

Represents a feature of the array. This is typically a region of the array coated or bound to DNA.

=cut

__PACKAGE__->table("element");

=head1 ACCESSORS

=head2 element_id

  data_type: integer
  default_value: nextval('element_element_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 feature_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 arraydesign_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "element_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('element_element_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "feature_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "arraydesign_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "type_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "dbxref_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
);
__PACKAGE__->set_primary_key("element_id");
__PACKAGE__->add_unique_constraint("element_c1", ["feature_id", "arraydesign_id"]);

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 arraydesign

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Arraydesign>

=cut

__PACKAGE__->belongs_to(
  "arraydesign",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { arraydesign_id => "arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 element_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::ElementRelationship>

=cut

__PACKAGE__->has_many(
  "element_relationship_objects",
  "Bio::Chado::Schema::Mage::ElementRelationship",
  { "foreign.object_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 element_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::ElementRelationship>

=cut

__PACKAGE__->has_many(
  "element_relationship_subjects",
  "Bio::Chado::Schema::Mage::ElementRelationship",
  { "foreign.subject_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 elementresults

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Elementresult>

=cut

__PACKAGE__->has_many(
  "elementresults",
  "Bio::Chado::Schema::Mage::Elementresult",
  { "foreign.element_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pKDjqDaS4Wo8Xf/QbQLPPA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
