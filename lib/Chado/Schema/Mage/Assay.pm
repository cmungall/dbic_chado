package Chado::Schema::Mage::Assay;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("assay");
__PACKAGE__->add_columns(
  "assay_id",
  {
    data_type => "integer",
    default_value => "nextval('assay_assay_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "arraydesign_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "protocol_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "assaydate",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 1,
    size => 8,
  },
  "arrayidentifier",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "arraybatchidentifier",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "operator_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("assay_id");
__PACKAGE__->add_unique_constraint("assay_c1", ["name"]);
__PACKAGE__->add_unique_constraint("assay_pkey", ["assay_id"]);
__PACKAGE__->has_many(
  "acquisitions",
  "Chado::Schema::Mage::Acquisition",
  { "foreign.assay_id" => "self.assay_id" },
);
__PACKAGE__->belongs_to(
  "protocol_id",
  "Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
);
__PACKAGE__->belongs_to(
  "arraydesign_id",
  "Chado::Schema::Mage::Arraydesign",
  { arraydesign_id => "arraydesign_id" },
);
__PACKAGE__->has_many(
  "assay_biomaterials",
  "Chado::Schema::Mage::AssayBiomaterial",
  { "foreign.assay_id" => "self.assay_id" },
);
__PACKAGE__->has_many(
  "assay_projects",
  "Chado::Schema::Mage::AssayProject",
  { "foreign.assay_id" => "self.assay_id" },
);
__PACKAGE__->has_many(
  "assayprops",
  "Chado::Schema::Mage::Assayprop",
  { "foreign.assay_id" => "self.assay_id" },
);
__PACKAGE__->has_many(
  "controls",
  "Chado::Schema::Mage::Control",
  { "foreign.assay_id" => "self.assay_id" },
);
__PACKAGE__->has_many(
  "study_assays",
  "Chado::Schema::Mage::StudyAssay",
  { "foreign.assay_id" => "self.assay_id" },
);
__PACKAGE__->has_many(
  "studyfactorvalues",
  "Chado::Schema::Mage::Studyfactorvalue",
  { "foreign.assay_id" => "self.assay_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6sdH8vUqcZZHr6dRDS+JQw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
