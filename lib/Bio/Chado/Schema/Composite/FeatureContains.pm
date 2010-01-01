package Bio::Chado::Schema::Composite::FeatureContains;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FeatureContains - subject intervals contains (or is
same as) object interval. transitive,reflexive

=cut

__PACKAGE__->table("feature_contains");

=head1 ACCESSORS

=head2 subject_id

=head2 object_id

=cut

__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PPahv0dm6m1wP3dG+eOsUg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
