package Bio::Chado::Schema::Sequence::IntronCombinedView;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::IntronCombinedView

=cut

__PACKAGE__->table("intron_combined_view");

=head1 ACCESSORS

=head2 exon1_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 exon2_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 fmin

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 fmax

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 strand

  data_type: smallint
  default_value: undef
  is_nullable: 1

=head2 srcfeature_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 intron_rank

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 transcript_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "exon1_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "exon2_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "fmin",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "fmax",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "strand",
  { data_type => "smallint", default_value => undef, is_nullable => 1 },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "intron_rank",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "transcript_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:21:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:95uR6XU6SPxQmnnUnLpF5w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
