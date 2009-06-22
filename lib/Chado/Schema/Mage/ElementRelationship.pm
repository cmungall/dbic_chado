package Chado::Schema::Mage::ElementRelationship;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("element_relationship");
__PACKAGE__->add_columns(
  "element_relationship_id",
  {
    data_type => "integer",
    default_value => "nextval('element_relationship_element_relationship_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("element_relationship_id");
__PACKAGE__->add_unique_constraint(
  "element_relationship_c1",
  ["subject_id", "object_id", "type_id", "rank"],
);
__PACKAGE__->add_unique_constraint("element_relationship_pkey", ["element_relationship_id"]);
__PACKAGE__->belongs_to(
  "object_id",
  "Chado::Schema::Mage::Element",
  { element_id => "object_id" },
);
__PACKAGE__->belongs_to(
  "subject_id",
  "Chado::Schema::Mage::Element",
  { element_id => "subject_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:O7jI467ak8t0xhnmClKpjQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
