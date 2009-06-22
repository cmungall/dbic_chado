package Chado::Schema::Sequence::FeaturepropPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featureprop_pub");
__PACKAGE__->add_columns(
  "featureprop_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('featureprop_pub_featureprop_pub_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "featureprop_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("featureprop_pub_id");
__PACKAGE__->add_unique_constraint("featureprop_pub_pkey", ["featureprop_pub_id"]);
__PACKAGE__->add_unique_constraint("featureprop_pub_c1", ["featureprop_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "featureprop_id",
  "Chado::Schema::Sequence::Featureprop",
  { featureprop_id => "featureprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:L3um9Xq3wuH2C5XoaiVk3g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
