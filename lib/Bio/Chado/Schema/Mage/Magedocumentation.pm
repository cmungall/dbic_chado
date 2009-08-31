package Bio::Chado::Schema::Mage::Magedocumentation;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "mageml_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "tableinfo_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
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
__PACKAGE__->belongs_to(
  "tableinfo",
  "Bio::Chado::Schema::General::Tableinfo",
  { tableinfo_id => "tableinfo_id" },
);
__PACKAGE__->belongs_to(
  "mageml",
  "Bio::Chado::Schema::Mage::Mageml",
  { mageml_id => "mageml_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s+BchuXiiu8PUyVlWyrkUw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
