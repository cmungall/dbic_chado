package Bio::Chado::Schema::Mage::Arraydesignprop;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "arraydesign_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
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
__PACKAGE__->add_unique_constraint("arraydesignprop_c1", ["arraydesign_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "arraydesign",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { arraydesign_id => "arraydesign_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vHeOIxYby99cG48NtEw2cA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
