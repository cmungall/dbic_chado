package Bio::Chado::Schema::Composite::FeatureIntersection;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FeatureIntersection

=head1 DESCRIPTION

set-intersection on interval defined by featureloc. featurelocs must meet

=cut

__PACKAGE__->table("feature_intersection");

=head1 ACCESSORS

=head2 subject_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 object_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 srcfeature_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 subject_strand

  data_type: smallint
  default_value: undef
  is_nullable: 1

=head2 object_strand

  data_type: smallint
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

=cut

__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "subject_strand",
  { data_type => "smallint", default_value => undef, is_nullable => 1 },
  "object_strand",
  { data_type => "smallint", default_value => undef, is_nullable => 1 },
  "fmin",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "fmax",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:21:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s9IMB+BAEgbRKiUM+54D1w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
