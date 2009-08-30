package Bio::Chado::Schema::Sequence::FeatureDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_dbxref");
__PACKAGE__->add_columns(
  "feature_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_dbxref_feature_dbxref_id_seq'::regclass)",
    is_auto_increment => 1,
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
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_current",
  {
    data_type => "boolean",
    default_value => "true",
    is_nullable => 0,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("feature_dbxref_id");
__PACKAGE__->add_unique_constraint("feature_dbxref_c1", ["feature_id", "dbxref_id"]);
__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pJyjoL1QKhhhReRyUG+w1w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
