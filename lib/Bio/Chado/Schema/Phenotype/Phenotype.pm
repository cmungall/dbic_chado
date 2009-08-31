package Bio::Chado::Schema::Phenotype::Phenotype;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phenotype");
__PACKAGE__->add_columns(
  "phenotype_id",
  {
    data_type => "integer",
    default_value => "nextval('phenotype_phenotype_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "observable_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "attr_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "cvalue_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "assay_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("phenotype_id");
__PACKAGE__->add_unique_constraint("phenotype_c1", ["uniquename"]);
__PACKAGE__->has_many(
  "feature_phenotypes",
  "Bio::Chado::Schema::Phenotype::FeaturePhenotype",
  { "foreign.phenotype_id" => "self.phenotype_id" },
);
__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "assay_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "attr",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "attr_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "observable",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "observable_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "cvalue",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvalue_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_phenotype1_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.phenotype1_id" => "self.phenotype_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_phenotype2_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.phenotype2_id" => "self.phenotype_id" },
);
__PACKAGE__->has_many(
  "phenotype_cvterms",
  "Bio::Chado::Schema::Phenotype::PhenotypeCvterm",
  { "foreign.phenotype_id" => "self.phenotype_id" },
);
__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.phenotype_id" => "self.phenotype_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0x5J4tE8IB23Sx7aM3ve2Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
