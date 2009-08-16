package Bio::Chado::Schema::Mage::StudypropFeature;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studyprop_feature");
__PACKAGE__->add_columns(
  "studyprop_feature_id",
  {
    data_type => "integer",
    default_value => "nextval('studyprop_feature_studyprop_feature_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "studyprop_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
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
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("studyprop_feature_id");
__PACKAGE__->add_unique_constraint(
  "studyprop_feature_studyprop_id_key",
  ["studyprop_id", "feature_id"],
);
__PACKAGE__->belongs_to(
  "studyprop",
  "Bio::Chado::Schema::Mage::Studyprop",
  { studyprop_id => "studyprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:voQFoKmTPcbtRndVcrQ1PA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
