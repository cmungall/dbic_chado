package Bio::Chado::Schema::Composite::FeatureDifference;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FeatureDifference

=head1 DESCRIPTION

size of gap between two features. must be abutting or disjoint

=cut

__PACKAGE__->table("feature_difference");

=head1 ACCESSORS

=head2 subject_id

  data_type: 'integer'
  is_nullable: 1

=head2 object_id

  data_type: 'integer'
  is_nullable: 1

=head2 srcfeature_id

  data_type: 'smallint'
  is_nullable: 1

=head2 fmin

  data_type: 'integer'
  is_nullable: 1

=head2 fmax

  data_type: 'integer'
  is_nullable: 1

=head2 strand

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", is_nullable => 1 },
  "object_id",
  { data_type => "integer", is_nullable => 1 },
  "srcfeature_id",
  { data_type => "smallint", is_nullable => 1 },
  "fmin",
  { data_type => "integer", is_nullable => 1 },
  "fmax",
  { data_type => "integer", is_nullable => 1 },
  "strand",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6LvmDps2sv7+cTs0f34TXQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
