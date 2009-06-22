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
    is_nullable => 0,
    size => 4,
  },
  "assay_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "project_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("assay_project_id");
__PACKAGE__->add_unique_constraint("assay_project_c1", ["assay_id", "project_id"]);
__PACKAGE__->add_unique_constraint("assay_project_pkey", ["assay_project_id"]);
__PACKAGE__->belongs_to(
  "assay_id",
  "Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7E9TX3uTOLkEQxEe6zwsGw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
