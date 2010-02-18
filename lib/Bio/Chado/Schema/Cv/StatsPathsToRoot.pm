package Bio::Chado::Schema::Cv::StatsPathsToRoot;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::StatsPathsToRoot

=head1 DESCRIPTION

per-cvterm statistics on its
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

=head2 total_paths

  data_type: bigint
  default_value: undef
  is_nullable: 1

=head2 avg_distance

  data_type: numeric
  default_value: undef
  is_nullable: 1
  size: ARRAY(0xa5673d8)

=head2 min_distance

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 max_distance

  data_type: integer
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "total_paths",
  { data_type => "bigint", default_value => undef, is_nullable => 1 },
  "avg_distance",
  {
    data_type => "numeric",
    default_value => undef,
    is_nullable => 1,
    size => [undef, undef],
  },
  "min_distance",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "max_distance",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FMqazsmPdM7SlmIAR9qr0g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
