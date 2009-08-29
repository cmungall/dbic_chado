package Bio::Chado::Schema::General::Tableinfo;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tableinfo");
__PACKAGE__->add_columns(
  "tableinfo_id",
  {
    data_type => "integer",
    default_value => "nextval('tableinfo_tableinfo_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 30,
  },
  "primary_key_column",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "is_view",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
  "view_on_table_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "superclass_table_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "is_updateable",
  { data_type => "integer", default_value => 1, is_nullable => 0, size => 4 },
  "modification_date",
  { data_type => "date", default_value => "now()", is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("tableinfo_id");
__PACKAGE__->add_unique_constraint("tableinfo_c1", ["name"]);
__PACKAGE__->has_many(
  "controls",
  "Bio::Chado::Schema::Mage::Control",
  { "foreign.tableinfo_id" => "self.tableinfo_id" },
);
__PACKAGE__->has_many(
  "magedocumentations",
  "Bio::Chado::Schema::Mage::Magedocumentation",
  { "foreign.tableinfo_id" => "self.tableinfo_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dIXfrilzdbb/UiKpSe7ChQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
