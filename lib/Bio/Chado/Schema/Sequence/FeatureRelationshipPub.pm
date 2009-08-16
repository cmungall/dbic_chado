package Bio::Chado::Schema::Sequence::FeatureRelationshipPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_relationship_pub");
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
__PACKAGE__->belongs_to(
  "feature_relationship",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "feature_relationship_id" => "feature_relationship_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6ErXNvN8OW7fgx4DZF8R1Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
