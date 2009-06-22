package Chado::Schema::Mage::Channel;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("channel");
__PACKAGE__->add_columns(
  "channel_id",
  {
    data_type => "integer",
    default_value => "nextval('channel_channel_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "definition",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("channel_id");
__PACKAGE__->add_unique_constraint("channel_pkey", ["channel_id"]);
__PACKAGE__->add_unique_constraint("channel_c1", ["name"]);
__PACKAGE__->has_many(
  "acquisitions",
  "Chado::Schema::Mage::Acquisition",
  { "foreign.channel_id" => "self.channel_id" },
);
__PACKAGE__->has_many(
  "assay_biomaterials",
  "Chado::Schema::Mage::AssayBiomaterial",
  { "foreign.channel_id" => "self.channel_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1EYhjfjifOIirUgb2G2kgA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
