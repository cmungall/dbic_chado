package Bio::Chado::Schema::Map::Featuremap;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featuremap");
__PACKAGE__->add_columns(
  "featuremap_id",
  {
    data_type => "integer",
    default_value => "nextval('featuremap_featuremap_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "unittype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("featuremap_id");
__PACKAGE__->add_unique_constraint("featuremap_c1", ["name"]);
__PACKAGE__->belongs_to(
  "unittype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "unittype_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "featuremap_pubs",
  "Bio::Chado::Schema::Map::FeaturemapPub",
  { "foreign.featuremap_id" => "self.featuremap_id" },
);
__PACKAGE__->has_many(
  "featurepo",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.featuremap_id" => "self.featuremap_id" },
);
__PACKAGE__->has_many(
  "featureranges",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.featuremap_id" => "self.featuremap_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RgRKyrJrzuRh22huusSSHg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
