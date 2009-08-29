package Bio::Chado::Schema::Sequence::FeatureCvtermPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_cvterm_pub");
__PACKAGE__->add_columns(
  "feature_cvterm_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_cvterm_pub_feature_cvterm_pub_id_seq'::regclass)",
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
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("feature_cvterm_pub_id");
__PACKAGE__->add_unique_constraint("feature_cvterm_pub_c1", ["feature_cvterm_id", "pub_id"]);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "feature_cvterm",
  "Bio::Chado::Schema::Sequence::FeatureCvterm",
  { feature_cvterm_id => "feature_cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/mAMmCzDR1gVEQXcfeM7Nw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
