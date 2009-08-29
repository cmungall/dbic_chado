package Bio::Chado::Schema::Organism::Organism;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("organism");
__PACKAGE__->add_columns(
  "organism_id",
  {
    data_type => "integer",
    default_value => "nextval('organism_organism_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "abbreviation",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "genus",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "species",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "common_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "comment",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("organism_id");
__PACKAGE__->add_unique_constraint("organism_c1", ["genus", "species"]);
__PACKAGE__->has_many(
  "biomaterials",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { "foreign.taxon_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "features",
  "Bio::Chado::Schema::Sequence::Feature",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "libraries",
  "Bio::Chado::Schema::Library::Library",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "organism_dbxrefs",
  "Bio::Chado::Schema::Organism::OrganismDbxref",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "organismprops",
  "Bio::Chado::Schema::Organism::Organismprop",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparisons",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "phylonode_organisms",
  "Bio::Chado::Schema::Phylogeny::PhylonodeOrganism",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "stocks",
  "Bio::Chado::Schema::Stock::Stock",
  { "foreign.organism_id" => "self.organism_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q3/xeWMW3JGsULN9WPS4pQ

__PACKAGE__->has_many(
  'features',
  'Chado::Schema::Sequence::Feature',
  { 'foreign.organism_id' => 'self.organism_id' },
);



# You can replace this text with custom content, and it will be preserved on regeneration
1;
