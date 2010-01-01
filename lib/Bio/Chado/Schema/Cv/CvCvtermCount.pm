package Bio::Chado::Schema::Cv::CvCvtermCount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::CvCvtermCount - per-cv terms counts (excludes obsoletes)

=cut

__PACKAGE__->table("cv_cvterm_count");

=head1 ACCESSORS

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 num_terms_excl_obs

  data_type: bigint
  default_value: undef
  is_nullable: 1
  size: 8

=cut

__PACKAGE__->add_columns(
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "num_terms_excl_obs",
  { data_type => "bigint", default_value => undef, is_nullable => 1, size => 8 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Tm4cT+ZZlGfR5Y+nnBos6w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
