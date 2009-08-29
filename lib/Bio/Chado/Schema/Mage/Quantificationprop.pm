package Bio::Chado::Schema::Mage::Quantificationprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("quantificationprop");
__PACKAGE__->add_columns(
  "quantificationprop_id",
  {
    data_type => "integer",
    default_value => "nextval('quantificationprop_quantificationprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "quantification_id",
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
__PACKAGE__->set_primary_key("quantificationprop_id");
__PACKAGE__->add_unique_constraint(
  "quantificationprop_c1",
  ["quantification_id", "type_id", "rank"],
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "quantification",
  "Bio::Chado::Schema::Mage::Quantification",
  { quantification_id => "quantification_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tFS9dLbMFGV4nT5BG6HPRA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
