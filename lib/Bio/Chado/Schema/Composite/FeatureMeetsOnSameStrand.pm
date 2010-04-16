package Bio::Chado::Schema::Composite::FeatureMeetsOnSameStrand;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FeatureMeetsOnSameStrand

=head1 DESCRIPTION

as feature_meets, but
featurelocs must be on the same strand. symmetric,reflexive

=cut

__PACKAGE__->table("feature_meets_on_same_strand");

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YiMS/G4c00y181GB13Citg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
