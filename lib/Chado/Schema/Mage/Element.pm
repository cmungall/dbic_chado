package Chado::Schema::Mage::Element;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("element");
__PACKAGE__->add_columns(
  "element_id",
  {
    data_type => "integer",
    default_value => "nextval('element_element_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "arraydesign_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("element_id");
__PACKAGE__->add_unique_constraint("element_pkey", ["element_id"]);
__PACKAGE__->add_unique_constraint("element_c1", ["feature_id", "arraydesign_id"]);
__PACKAGE__->belongs_to(
  "arraydesign_id",
  "Chado::Schema::Mage::Arraydesign",
  { arraydesign_id => "arraydesign_id" },
);
__PACKAGE__->has_many(
  "element_relationship_object_ids",
  "Chado::Schema::Mage::ElementRelationship",
  { "foreign.object_id" => "self.element_id" },
);
__PACKAGE__->has_many(
  "element_relationship_subject_ids",
  "Chado::Schema::Mage::ElementRelationship",
  { "foreign.subject_id" => "self.element_id" },
);
__PACKAGE__->has_many(
  "elementresults",
  "Chado::Schema::Mage::Elementresult",
  { "foreign.element_id" => "self.element_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BSCOVYzhX4DQsd3Y0V39dg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
