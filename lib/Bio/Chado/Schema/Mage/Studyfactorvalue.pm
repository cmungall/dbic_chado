package Bio::Chado::Schema::Mage::Studyfactorvalue;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studyfactorvalue");
__PACKAGE__->add_columns(
  "studyfactorvalue_id",
  {
    data_type => "integer",
    default_value => "nextval('studyfactorvalue_studyfactorvalue_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "studyfactor_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "assay_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "factorvalue",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("studyfactorvalue_id");
__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);
__PACKAGE__->belongs_to(
  "studyfactor",
  "Bio::Chado::Schema::Mage::Studyfactor",
  { studyfactor_id => "studyfactor_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R2b0OiAy8N2Xh5onmu34bA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
