package Bio::Chado::Schema::Map::Featurerange;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featurerange");
__PACKAGE__->add_columns(
  "featurerange_id",
  {
    data_type => "integer",
    default_value => "nextval('featurerange_featurerange_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "featuremap_id",
  {
    data_type => "integer",
    default_value => undef,
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
  "leftstartf_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "leftendf_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "rightstartf_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "rightendf_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "rangestr",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("featurerange_id");
__PACKAGE__->belongs_to(
  "featuremap",
  "Bio::Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
);
__PACKAGE__->belongs_to(
  "leftendf",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "leftendf_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "rightstartf",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "rightstartf_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "rightendf",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "rightendf_id" },
);
__PACKAGE__->belongs_to(
  "leftstartf",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "leftstartf_id" },
);
__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RBZlyf8/z4erTEK29HPVGw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
