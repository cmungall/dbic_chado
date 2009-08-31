package Bio::Chado::Schema::Genetic::PhenotypeComparison;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phenotype_comparison");
__PACKAGE__->add_columns(
  "phenotype_comparison_id",
  {
    data_type => "integer",
    default_value => "nextval('phenotype_comparison_phenotype_comparison_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "genotype1_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "environment1_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "genotype2_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "environment2_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "phenotype1_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "phenotype2_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "organism_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("phenotype_comparison_id");
__PACKAGE__->add_unique_constraint(
  "phenotype_comparison_c1",
  [
    "genotype1_id",
    "environment1_id",
    "genotype2_id",
    "environment2_id",
    "phenotype1_id",
    "pub_id",
  ],
);
__PACKAGE__->belongs_to(
  "environment2",
  "Bio::Chado::Schema::Genetic::Environment",
  { environment_id => "environment2_id" },
);
__PACKAGE__->belongs_to(
  "genotype1",
  "Bio::Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype1_id" },
);
__PACKAGE__->belongs_to(
  "phenotype1",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { phenotype_id => "phenotype1_id" },
);
__PACKAGE__->belongs_to(
  "environment1",
  "Bio::Chado::Schema::Genetic::Environment",
  { environment_id => "environment1_id" },
);
__PACKAGE__->belongs_to(
  "phenotype2",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { phenotype_id => "phenotype2_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
);
__PACKAGE__->belongs_to(
  "genotype2",
  "Bio::Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype2_id" },
);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->has_many(
  "phenotype_comparison_cvterms",
  "Bio::Chado::Schema::Genetic::PhenotypeComparisonCvterm",
  {
    "foreign.phenotype_comparison_id" => "self.phenotype_comparison_id",
  },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7pG3XS5kNWmjC+yKA34Asw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
