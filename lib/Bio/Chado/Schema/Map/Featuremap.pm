package Bio::Chado::Schema::Map::Featuremap;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Map::Featuremap

=cut

__PACKAGE__->table("featuremap");

=head1 ACCESSORS

=head2 featuremap_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'featuremap_featuremap_id_seq'

=head2 name

  data_type: 'character varying'
  is_nullable: 1
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 unittype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "featuremap_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "featuremap_featuremap_id_seq",
  },
  "name",
  { data_type => "character varying", is_nullable => 1, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "unittype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("featuremap_id");
__PACKAGE__->add_unique_constraint("featuremap_c1", ["name"]);

=head1 RELATIONS

=head2 unittype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "unittype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "unittype_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 featuremap_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Map::FeaturemapPub>

=cut

__PACKAGE__->has_many(
  "featuremap_pubs",
  "Bio::Chado::Schema::Map::FeaturemapPub",
  { "foreign.featuremap_id" => "self.featuremap_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurepos

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurepos>

=cut

__PACKAGE__->has_many(
  "featurepos",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.featuremap_id" => "self.featuremap_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featureranges

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurerange>

=cut

__PACKAGE__->has_many(
  "featureranges",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.featuremap_id" => "self.featuremap_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+wt3iX2Yte10Frl3giTfnA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
