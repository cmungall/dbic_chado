package Bio::Chado::Schema::Sequence::FeaturelocPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featureloc_pub");
__PACKAGE__->add_columns(
  "featureloc_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('featureloc_pub_featureloc_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "featureloc_id",
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
__PACKAGE__->set_primary_key("featureloc_pub_id");
__PACKAGE__->add_unique_constraint("featureloc_pub_c1", ["featureloc_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "featureloc",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { featureloc_id => "featureloc_id" },
);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lM4xrPZFtBrEMhS2osZ9Ng


# You can replace this text with custom content, and it will be preserved on regeneration
1;
