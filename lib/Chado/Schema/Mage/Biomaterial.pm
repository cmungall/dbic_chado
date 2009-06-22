package Chado::Schema::Mage::Biomaterial;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("biomaterial");
__PACKAGE__->add_columns(
  "biomaterial_id",
  {
    data_type => "integer",
    default_value => "nextval('biomaterial_biomaterial_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "taxon_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "biosourceprovider_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
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
__PACKAGE__->set_primary_key("biomaterial_id");
__PACKAGE__->add_unique_constraint("biomaterial_c1", ["name"]);
__PACKAGE__->add_unique_constraint("biomaterial_pkey", ["biomaterial_id"]);
__PACKAGE__->has_many(
  "assay_biomaterials",
  "Chado::Schema::Mage::AssayBiomaterial",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterial_dbxrefs",
  "Chado::Schema::Mage::BiomaterialDbxref",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterialprops",
  "Chado::Schema::Mage::Biomaterialprop",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterial_relationship_subject_ids",
  "Chado::Schema::Mage::BiomaterialRelationship",
  { "foreign.subject_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterial_relationship_object_ids",
  "Chado::Schema::Mage::BiomaterialRelationship",
  { "foreign.object_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterial_treatments",
  "Chado::Schema::Mage::BiomaterialTreatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "treatments",
  "Chado::Schema::Mage::Treatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4R9UhwT4eQ4lYmClv5R7xw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
