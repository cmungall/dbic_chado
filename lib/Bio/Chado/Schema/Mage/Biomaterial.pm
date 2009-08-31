package Bio::Chado::Schema::Mage::Biomaterial;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "taxon_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "biosourceprovider_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
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
__PACKAGE__->has_many(
  "assay_biomaterials",
  "Bio::Chado::Schema::Mage::AssayBiomaterial",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->belongs_to(
  "taxon",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "taxon_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "biosourceprovider",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "biosourceprovider_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "biomaterial_dbxrefs",
  "Bio::Chado::Schema::Mage::BiomaterialDbxref",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterialprops",
  "Bio::Chado::Schema::Mage::Biomaterialprop",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterial_relationship_subject_ids",
  "Bio::Chado::Schema::Mage::BiomaterialRelationship",
  { "foreign.subject_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterial_relationship_object_ids",
  "Bio::Chado::Schema::Mage::BiomaterialRelationship",
  { "foreign.object_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "biomaterial_treatments",
  "Bio::Chado::Schema::Mage::BiomaterialTreatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);
__PACKAGE__->has_many(
  "treatments",
  "Bio::Chado::Schema::Mage::Treatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DbjVHGPjYeX0LHNgX+d/tA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
