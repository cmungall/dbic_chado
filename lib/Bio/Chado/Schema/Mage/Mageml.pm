package Bio::Chado::Schema::Mage::Mageml;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("mageml");
__PACKAGE__->add_columns(
  "mageml_id",
  {
    data_type => "integer",
    default_value => "nextval('mageml_mageml_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "mage_package",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "mage_ml",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("mageml_id");
__PACKAGE__->has_many(
  "magedocumentations",
  "Bio::Chado::Schema::Mage::Magedocumentation",
  { "foreign.mageml_id" => "self.mageml_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qhb1pfGh/UF2MELd014u3g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
