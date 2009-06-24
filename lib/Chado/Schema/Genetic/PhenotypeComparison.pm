package Chado::Schema::Genetic::PhenotypeComparison;

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
  "Chado::Schema::Genetic::Environment",
  { environment_id => "environment2_id" },
);
__PACKAGE__->belongs_to(
  "genotype1",
  "Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype1_id" },
);
__PACKAGE__->belongs_to(
  "environment1",
  "Chado::Schema::Genetic::Environment",
  { environment_id => "environment1_id" },
);
__PACKAGE__->belongs_to(
  "genotype2",
  "Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype2_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_cvterms",
  "Chado::Schema::Genetic::PhenotypeComparisonCvterm",
  {
    "foreign.phenotype_comparison_id" => "self.phenotype_comparison_id",
  },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6MuX3zwB4/H1bu+xebnnOA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
