package Bio::Chado::Schema::Genetic::Environment;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("environment");
__PACKAGE__->add_columns(
  "environment_id",
  {
    data_type => "integer",
    default_value => "nextval('environment_environment_id_seq'::regclass)",
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
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("environment_id");
__PACKAGE__->add_unique_constraint("environment_c1", ["uniquename"]);
__PACKAGE__->has_many(
  "environment_cvterms",
  "Bio::Chado::Schema::Genetic::EnvironmentCvterm",
  { "foreign.environment_id" => "self.environment_id" },
);
__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Genetic::Phendesc",
  { "foreign.environment_id" => "self.environment_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_environment2_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.environment2_id" => "self.environment_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_environment1_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.environment1_id" => "self.environment_id" },
);
__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.environment_id" => "self.environment_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Rt/qvapP2iXSe01gajLn1w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
