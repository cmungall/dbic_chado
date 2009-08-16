package Bio::Chado::Schema::Sequence::FeaturePubprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_pubprop");
__PACKAGE__->add_columns(
  "feature_pubprop_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_pubprop_feature_pubprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("feature_pubprop_id");
__PACKAGE__->add_unique_constraint("feature_pubprop_c1", ["feature_pub_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "feature_pub",
  "Bio::Chado::Schema::Sequence::FeaturePub",
  { feature_pub_id => "feature_pub_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Zse1dMMWee6aawteeHH6xA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
