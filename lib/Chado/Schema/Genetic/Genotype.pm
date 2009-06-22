package Chado::Schema::Genetic::Genotype;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("genotype");
__PACKAGE__->add_columns(
  "genotype_id",
  {
    data_type => "integer",
    default_value => "nextval('genotype_genotype_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "description",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("genotype_id");
__PACKAGE__->add_unique_constraint("genotype_pkey", ["genotype_id"]);
__PACKAGE__->add_unique_constraint("genotype_c1", ["uniquename"]);
__PACKAGE__->has_many(
  "feature_genotypes",
  "Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phendescs",
  "Chado::Schema::Genetic::Phendesc",
  { "foreign.genotype_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_genotype1_ids",
  "Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype1_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_genotype2_ids",
  "Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype2_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phenstatements",
  "Chado::Schema::Genetic::Phenstatement",
  { "foreign.genotype_id" => "self.genotype_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BOv9HBSPC7vu1qjbbs0+oA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
