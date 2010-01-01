package Bio::Chado::Schema::Composite::FeatureDistance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FeatureDistance

=cut

__PACKAGE__->table("feature_distance");

=head1 ACCESSORS

=head2 subject_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 object_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 srcfeature_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 subject_strand

  data_type: smallint
  default_value: undef
  is_nullable: 1
  size: 2

=head2 object_strand

  data_type: smallint
  default_value: undef
  is_nullable: 1
  size: 2

=head2 distance

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "subject_strand",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "object_strand",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "distance",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C2k04YVVP1rRgy+uMtz57A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
