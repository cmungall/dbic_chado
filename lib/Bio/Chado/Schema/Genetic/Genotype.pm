package Bio::Chado::Schema::Genetic::Genotype;

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
    is_auto_increment => 1,
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
__PACKAGE__->add_unique_constraint("genotype_c1", ["uniquename"]);
__PACKAGE__->has_many(
  "feature_genotypes",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Genetic::Phendesc",
  { "foreign.genotype_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_genotype1_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype1_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_genotype2_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype2_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.genotype_id" => "self.genotype_id" },
);
__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Stock::StockGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R1B6rp8QbuUPUl29DSSTzQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
