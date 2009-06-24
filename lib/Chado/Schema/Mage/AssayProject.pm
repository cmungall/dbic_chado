package Chado::Schema::Mage::AssayProject;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("assay_project");
__PACKAGE__->add_columns(
  "assay_project_id",
  {
    data_type => "integer",
    default_value => "nextval('assay_project_assay_project_id_seq'::regclass)",
    is_auto_increment => 1,
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
  "project_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("assay_project_id");
__PACKAGE__->add_unique_constraint("assay_project_c1", ["assay_id", "project_id"]);
__PACKAGE__->belongs_to(
  "assay",
  "Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cYPFyzVpUZt27NWw4bo+5w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
