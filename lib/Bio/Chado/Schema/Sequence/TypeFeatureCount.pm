package Bio::Chado::Schema::Sequence::TypeFeatureCount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::TypeFeatureCount - per-feature-type feature counts

=cut

__PACKAGE__->table("type_feature_count");

=head1 ACCESSORS

=head2 type

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 num_features

  data_type: 'bigint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "type",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "num_features",
  { data_type => "bigint", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:V1Blv2gjIYloxglgXxJomA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
