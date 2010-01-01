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
  size: 4

=head2 exon2_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 fmin

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 fmax

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 strand

  data_type: smallint
  default_value: undef
  is_nullable: 1
  size: 2

=head2 srcfeature_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 intron_rank

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 transcript_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "exon1_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "exon2_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "fmin",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "fmax",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "strand",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "intron_rank",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "transcript_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8lGSXYAoaAC13Mr5685gAw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
