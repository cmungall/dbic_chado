package Bio::Chado::Schema::Genetic::PhenotypeComparisonCvterm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phenotype_comparison_cvterm");
__PACKAGE__->add_columns(
  "phenotype_comparison_cvterm_id",
  {
    data_type => "integer",
    default_value => "nextval('phenotype_comparison_cvterm_phenotype_comparison_cvterm_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "phenotype_comparison_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "cvterm_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
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
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("phenotype_comparison_cvterm_id");
__PACKAGE__->add_unique_constraint(
  "phenotype_comparison_cvterm_c1",
  ["phenotype_comparison_id", "cvterm_id"],
);
__PACKAGE__->belongs_to(
  "phenotype_comparison",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "phenotype_comparison_id" => "phenotype_comparison_id" },
);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gPibRrg9S/eocaJA+f0QnQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
