package Chado::Schema::Sequence::TypeFeatureCount;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("type_feature_count");
__PACKAGE__->add_columns(
  "type",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 1024,
  },
  "num_features",
  { data_type => "bigint", default_value => undef, is_nullable => 1, size => 8 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tg+u+goC37l4V2D76YMugQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
