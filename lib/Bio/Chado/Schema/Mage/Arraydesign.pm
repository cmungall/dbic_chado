package Bio::Chado::Schema::Mage::Arraydesign;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("arraydesign");
__PACKAGE__->add_columns(
  "arraydesign_id",
  {
    data_type => "integer",
    default_value => "nextval('arraydesign_arraydesign_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "manufacturer_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "platformtype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "substratetype_id",
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
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "version",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "array_dimensions",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "element_dimensions",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "num_of_elements",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_array_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_array_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_grid_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_grid_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_sub_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_sub_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("arraydesign_id");
__PACKAGE__->add_unique_constraint("arraydesign_c1", ["name"]);
__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "arraydesignprops",
  "Bio::Chado::Schema::Mage::Arraydesignprop",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
);
__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
);
__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n7lcQW1S03CeMjZCcJEdAg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
