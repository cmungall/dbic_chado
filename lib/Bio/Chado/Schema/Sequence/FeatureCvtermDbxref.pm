package Bio::Chado::Schema::Sequence::FeatureCvtermDbxref;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_cvterm_id",
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
);
__PACKAGE__->set_primary_key("feature_cvterm_dbxref_id");
__PACKAGE__->add_unique_constraint(
  "feature_cvterm_dbxref_c1",
  ["feature_cvterm_id", "dbxref_id"],
);
__PACKAGE__->belongs_to(
  "feature_cvterm",
  "Bio::Chado::Schema::Sequence::FeatureCvterm",
  { feature_cvterm_id => "feature_cvterm_id" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nX0iFZvAyu2OSe7mS+N6AA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
