package Bio::Chado::Schema::Cv::CvRoot;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::CvRoot - the roots of a cv are the set of terms
which have no parents (terms that are not the subject of a
relation). Most cvs will have a single root, some may have >1. All
will have at least 1

=cut

__PACKAGE__->table("cv_root");

=head1 ACCESSORS

=head2 cv_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 root_cvterm_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "cv_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "root_cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UrVO1NDR9razNPldC0ApZQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
