package Bio::Chado::Schema::Composite::AllFeatureNames;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::AllFeatureNames

=cut

__PACKAGE__->table("all_feature_names");

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'character varying'
  is_nullable: 1
  size: 255

=head2 organism_id

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "character varying", is_nullable => 1, size => 255 },
  "organism_id",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FrpBLgpZr+5AoWBGb/Gb8A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
