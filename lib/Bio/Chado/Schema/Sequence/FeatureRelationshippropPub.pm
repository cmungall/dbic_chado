package Bio::Chado::Schema::Sequence::FeatureRelationshippropPub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::FeatureRelationshippropPub - Provenance for feature_relationshipprop.

=cut

__PACKAGE__->table("feature_relationshipprop_pub");

=head1 ACCESSORS

=head2 feature_relationshipprop_pub_id

  data_type: integer
  default_value: nextval('feature_relationshipprop_pub_feature_relationshipprop_pub_i_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 feature_relationshipprop_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "feature_relationshipprop_pub_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('feature_relationshipprop_pub_feature_relationshipprop_pub_i_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "feature_relationshipprop_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "pub_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("feature_relationshipprop_pub_id");
__PACKAGE__->add_unique_constraint(
  "feature_relationshipprop_pub_c1",
  ["feature_relationshipprop_id", "pub_id"],
);

=head1 RELATIONS

=head2 feature_relationshipprop

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::FeatureRelationshipprop>

=cut

__PACKAGE__->belongs_to(
  "feature_relationshipprop",
  "Bio::Chado::Schema::Sequence::FeatureRelationshipprop",
  { "feature_relationshipprop_id" => "feature_relationshipprop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LYa6ShKXH/69B9VtP5KAGg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
