package Bio::Chado::Schema::Mage::Elementresult;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Elementresult

=head1 DESCRIPTION

An element on an array produces a measurement when hybridized to a biomaterial (traceable through quantification_id). This is the base data from which tables that actually contain data inherit.

=cut

__PACKAGE__->table("elementresult");

=head1 ACCESSORS

=head2 elementresult_id

  data_type: integer
  default_value: nextval('elementresult_elementresult_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 element_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 quantification_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 signal

  data_type: double precision
  default_value: undef
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "elementresult_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('elementresult_elementresult_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "element_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "quantification_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "signal",
  {
    data_type     => "double precision",
    default_value => undef,
    is_nullable   => 0,
  },
);
__PACKAGE__->set_primary_key("elementresult_id");
__PACKAGE__->add_unique_constraint("elementresult_c1", ["element_id", "quantification_id"]);

=head1 RELATIONS

=head2 element

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Element>

=cut

__PACKAGE__->belongs_to(
  "element",
  "Bio::Chado::Schema::Mage::Element",
  { element_id => "element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 quantification

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Quantification>

=cut

__PACKAGE__->belongs_to(
  "quantification",
  "Bio::Chado::Schema::Mage::Quantification",
  { quantification_id => "quantification_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 elementresult_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::ElementresultRelationship>

=cut

__PACKAGE__->has_many(
  "elementresult_relationship_subjects",
  "Bio::Chado::Schema::Mage::ElementresultRelationship",
  { "foreign.subject_id" => "self.elementresult_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 elementresult_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::ElementresultRelationship>

=cut

__PACKAGE__->has_many(
  "elementresult_relationship_objects",
  "Bio::Chado::Schema::Mage::ElementresultRelationship",
  { "foreign.object_id" => "self.elementresult_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kozWlbVuRPkQ3lQ+CyoTRw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
