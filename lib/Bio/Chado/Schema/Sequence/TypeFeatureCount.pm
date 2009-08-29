package Bio::Chado::Schema::Sequence::TypeFeatureCount;

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


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:i5xalD2efZjufAh9rO++4g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
