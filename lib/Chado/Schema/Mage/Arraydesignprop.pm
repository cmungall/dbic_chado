package Chado::Schema::Mage::Arraydesignprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("arraydesignprop");
__PACKAGE__->add_columns(
  "arraydesignprop_id",
  {
    data_type => "integer",
    default_value => "nextval('arraydesignprop_arraydesignprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "arraydesign_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
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
__PACKAGE__->set_primary_key("arraydesignprop_id");
__PACKAGE__->add_unique_constraint("arraydesignprop_pkey", ["arraydesignprop_id"]);
__PACKAGE__->add_unique_constraint("arraydesignprop_c1", ["arraydesign_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "arraydesign_id",
  "Chado::Schema::Mage::Arraydesign",
  { arraydesign_id => "arraydesign_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UxcRooaocn2DEJZmPZ7Qfw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
