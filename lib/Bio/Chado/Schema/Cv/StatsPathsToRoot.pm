package Bio::Chado::Schema::Cv::StatsPathsToRoot;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stats_paths_to_root");
__PACKAGE__->add_columns(
  "cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "total_paths",
  { data_type => "bigint", default_value => undef, is_nullable => 1, size => 8 },
  "avg_distance",
  {
    data_type => "numeric",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "min_distance",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "max_distance",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X0ICh1urW9b9tN2amtuHrg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
