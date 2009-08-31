package Bio::Chado::Schema::Map::Featurepos;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featurepos");
__PACKAGE__->add_columns(
  "featurepos_id",
  {
    data_type => "integer",
    default_value => "nextval('featurepos_featurepos_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "featuremap_id",
  {
    data_type => "integer",
    default_value => "nextval('featurepos_featuremap_id_seq'::regclass)",
    is_auto_increment => 1,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "map_feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "mappos",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("featurepos_id");
__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);
__PACKAGE__->belongs_to(
  "map_feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "map_feature_id" },
);
__PACKAGE__->belongs_to(
  "featuremap",
  "Bio::Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:39/Xvd20AW8jnjhZJCQFZA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
