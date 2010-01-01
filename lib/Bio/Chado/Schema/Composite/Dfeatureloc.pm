package Bio::Chado::Schema::Composite::Dfeatureloc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::Dfeatureloc

=cut

__PACKAGE__->table("dfeatureloc");

=head1 ACCESSORS

=head2 featureloc_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 feature_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 srcfeature_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 nbeg

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 is_nbeg_partial

  data_type: boolean
  default_value: undef
  is_nullable: 1
  size: 1

=head2 nend

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 is_nend_partial

  data_type: boolean
  default_value: undef
  is_nullable: 1
  size: 1

=head2 strand

  data_type: smallint
  default_value: undef
  is_nullable: 1
  size: 2

=head2 phase

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 residue_info

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 locgroup

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 rank

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "featureloc_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "nbeg",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "is_nbeg_partial",
  { data_type => "boolean", default_value => undef, is_nullable => 1, size => 1 },
  "nend",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "is_nend_partial",
  { data_type => "boolean", default_value => undef, is_nullable => 1, size => 1 },
  "strand",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "phase",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "residue_info",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "locgroup",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "rank",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2YdBAb1pBfSzVGWRCKMBEA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
