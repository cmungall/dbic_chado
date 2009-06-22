package Chado::Schema::Map::FeaturemapPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featuremap_pub");
__PACKAGE__->add_columns(
  "featuremap_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('featuremap_pub_featuremap_pub_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "featuremap_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("featuremap_pub_id");
__PACKAGE__->add_unique_constraint("featuremap_pub_pkey", ["featuremap_pub_id"]);
__PACKAGE__->belongs_to(
  "featuremap_id",
  "Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UzyBqpXB6K/BNUHF4Eec8w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
