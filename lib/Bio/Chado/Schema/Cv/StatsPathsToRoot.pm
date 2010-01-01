package Bio::Chado::Schema::Cv::StatsPathsToRoot;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::StatsPathsToRoot - per-cvterm statistics on its
placement in the DAG relative to the root. There may be multiple paths
from any term to the root. This gives the total number of paths, and
the average minimum and maximum distances. Here distance is defined by
cvtermpath.pathdistance

=cut

__PACKAGE__->table("stats_paths_to_root");

=head1 ACCESSORS

=head2 cvterm_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 total_paths

  data_type: bigint
  default_value: undef
  is_nullable: 1
  size: 8

=head2 avg_distance

  data_type: numeric
  default_value: undef
  is_nullable: 1
  size: undef

=head2 min_distance

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 max_distance

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=cut

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


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZIq1NPvHhvvdsV7qj6VAiQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
