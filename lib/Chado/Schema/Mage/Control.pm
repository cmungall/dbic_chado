package Chado::Schema::Mage::Control;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("control");
__PACKAGE__->add_columns(
  "control_id",
  {
    data_type => "integer",
    default_value => "nextval('control_control_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "assay_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "tableinfo_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "row_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
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
__PACKAGE__->set_primary_key("control_id");
__PACKAGE__->add_unique_constraint("control_pkey", ["control_id"]);
__PACKAGE__->belongs_to(
  "assay_id",
  "Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eHYSXkDhrptp9+k8F0sczw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
