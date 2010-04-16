package Bio::Chado::Schema::Composite::FeatureMeets;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FeatureMeets

=head1 DESCRIPTION

intervals have at least one
interbase point in common (ie overlap OR abut). symmetric,reflexive

=cut

__PACKAGE__->table("feature_meets");

=head1 ACCESSORS

=head2 subject_id

  data_type: 'integer'
  is_nullable: 1

=head2 object_id

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", is_nullable => 1 },
  "object_id",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Y+faeXz1Rg+iZS2FzyQ/aQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
