package Chado::Schema::Mage::Magedocumentation;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("magedocumentation");
__PACKAGE__->add_columns(
  "magedocumentation_id",
  {
    data_type => "integer",
    default_value => "nextval('magedocumentation_magedocumentation_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "mageml_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "tableinfo_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "row_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "mageidentifier",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("magedocumentation_id");
__PACKAGE__->add_unique_constraint("magedocumentation_pkey", ["magedocumentation_id"]);
__PACKAGE__->belongs_to(
  "mageml_id",
  "Chado::Schema::Mage::Mageml",
  { mageml_id => "mageml_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aWjzeGsMifK4JyDBYCQdAw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
