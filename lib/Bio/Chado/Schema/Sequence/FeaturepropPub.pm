package Bio::Chado::Schema::Sequence::FeaturepropPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featureprop_pub");
__PACKAGE__->add_columns(
  "featureprop_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('featureprop_pub_featureprop_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "featureprop_id",
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
__PACKAGE__->set_primary_key("featureprop_pub_id");
__PACKAGE__->add_unique_constraint("featureprop_pub_c1", ["featureprop_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "featureprop",
  "Bio::Chado::Schema::Sequence::Featureprop",
  { featureprop_id => "featureprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:U5sv15XEJCEdZB/i/uiBBA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
