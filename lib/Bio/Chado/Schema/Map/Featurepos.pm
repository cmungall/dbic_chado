package Bio::Chado::Schema::Map::Featurepos;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Map::Featurepos

=cut

__PACKAGE__->table("featurepos");

=head1 ACCESSORS

=head2 featurepos_id

  data_type: integer
  default_value: nextval('featurepos_featurepos_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 featuremap_id

  data_type: integer
  default_value: nextval('featurepos_featuremap_id_seq'::regclass)
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 feature_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 map_feature_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

map_feature_id
links to the feature (map) upon which the feature is being localized.

=head2 mappos

  data_type: double precision
  default_value: undef
  is_nullable: 0
  size: 8

=cut

__PACKAGE__->add_columns(
  "featurepos_id",
  {
    data_type => "integer",
    default_value => "nextval('featurepos_featurepos_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "featuremap_id",
  {
    data_type => "integer",
    default_value => "nextval('featurepos_featuremap_id_seq'::regclass)",
    is_auto_increment => 1,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "map_feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "mappos",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("featurepos_id");

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 map_feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=cut

__PACKAGE__->belongs_to(
  "map_feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "map_feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featuremap

Type: belongs_to

Related object: L<Bio::Chado::Schema::Map::Featuremap>

=cut

__PACKAGE__->belongs_to(
  "featuremap",
  "Bio::Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sgHl5BgGEcTCX0qieawHvg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
