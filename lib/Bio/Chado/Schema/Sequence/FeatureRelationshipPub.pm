package Bio::Chado::Schema::Sequence::FeatureRelationshipPub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::FeatureRelationshipPub - Provenance. Attach optional evidence to a feature_relationship in the form of a publication.

=cut

__PACKAGE__->table("feature_relationship_pub");

=head1 ACCESSORS

=head2 feature_relationship_pub_id

  data_type: integer
  default_value: nextval('feature_relationship_pub_feature_relationship_pub_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 feature_relationship_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "feature_relationship_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_relationship_pub_feature_relationship_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_relationship_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("feature_relationship_pub_id");
__PACKAGE__->add_unique_constraint(
  "feature_relationship_pub_c1",
  ["feature_relationship_id", "pub_id"],
);

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_relationship

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::FeatureRelationship>

=cut

__PACKAGE__->belongs_to(
  "feature_relationship",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "feature_relationship_id" => "feature_relationship_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F3ypUfOP7RQKwFV1d+vHmw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
