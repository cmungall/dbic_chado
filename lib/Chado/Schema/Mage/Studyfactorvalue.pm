package Chado::Schema::Mage::Studyfactorvalue;

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
    is_nullable => 0,
    size => 4,
  },
  "studyfactor_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "assay_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
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
__PACKAGE__->add_unique_constraint("studyfactorvalue_pkey", ["studyfactorvalue_id"]);
__PACKAGE__->belongs_to(
  "assay_id",
  "Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);
__PACKAGE__->belongs_to(
  "studyfactor_id",
  "Chado::Schema::Mage::Studyfactor",
  { studyfactor_id => "studyfactor_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:os17a45Ol2ZouFQFyY8Ovg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
