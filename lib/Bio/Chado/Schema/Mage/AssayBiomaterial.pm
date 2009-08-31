package Bio::Chado::Schema::Mage::AssayBiomaterial;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("assay_biomaterial");
__PACKAGE__->add_columns(
  "assay_biomaterial_id",
  {
    data_type => "integer",
    default_value => "nextval('assay_biomaterial_assay_biomaterial_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "assay_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "biomaterial_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "channel_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("assay_biomaterial_id");
__PACKAGE__->add_unique_constraint(
  "assay_biomaterial_c1",
  ["assay_id", "biomaterial_id", "channel_id", "rank"],
);
__PACKAGE__->belongs_to(
  "channel",
  "Bio::Chado::Schema::Mage::Channel",
  { channel_id => "channel_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "biomaterial",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
);
__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/hxBBUKkAOIXra69eFUDbA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
