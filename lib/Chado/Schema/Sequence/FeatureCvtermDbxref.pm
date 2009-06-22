package Chado::Schema::Sequence::FeatureCvtermDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_cvterm_dbxref");
__PACKAGE__->add_columns(
  "feature_cvterm_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_cvterm_dbxref_feature_cvterm_dbxref_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "feature_cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("feature_cvterm_dbxref_id");
__PACKAGE__->add_unique_constraint("feature_cvterm_dbxref_pkey", ["feature_cvterm_dbxref_id"]);
__PACKAGE__->add_unique_constraint(
  "feature_cvterm_dbxref_c1",
  ["feature_cvterm_id", "dbxref_id"],
);
__PACKAGE__->belongs_to(
  "feature_cvterm_id",
  "Chado::Schema::Sequence::FeatureCvterm",
  { feature_cvterm_id => "feature_cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ruL4BNNDvmuZB6PFCKP3gA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
