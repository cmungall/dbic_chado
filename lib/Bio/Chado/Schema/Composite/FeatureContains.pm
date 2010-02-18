package Bio::Chado::Schema::Composite::FeatureContains;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FeatureContains

=head1 DESCRIPTION

subject intervals contains (or is
same as) object interval. transitive,reflexive

=cut

__PACKAGE__->table("feature_contains");

=head1 ACCESSORS

=head2 subject_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 object_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:21:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:80w3wQqQE58upDedxBz60Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
