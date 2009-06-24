package Chado::Schema::Sequence::FeatureCvterm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_cvterm");
__PACKAGE__->add_columns(
  "feature_cvterm_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_cvterm_feature_cvterm_id_seq'::regclass)",
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
  "cvterm_id",
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
  "is_not",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("feature_cvterm_id");
__PACKAGE__->add_unique_constraint(
  "feature_cvterm_c1",
  ["feature_id", "cvterm_id", "pub_id", "rank"],
);
__PACKAGE__->belongs_to(
  "feature",
  "Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);
__PACKAGE__->has_many(
  "feature_cvterm_dbxrefs",
  "Chado::Schema::Sequence::FeatureCvtermDbxref",
  { "foreign.feature_cvterm_id" => "self.feature_cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_cvtermprops",
  "Chado::Schema::Sequence::FeatureCvtermprop",
  { "foreign.feature_cvterm_id" => "self.feature_cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_cvterm_pubs",
  "Chado::Schema::Sequence::FeatureCvtermPub",
  { "foreign.feature_cvterm_id" => "self.feature_cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:b5cFxX83ci0gsV/v8g/iPg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
