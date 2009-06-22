package Chado::Schema::Phenotype::Phenotype;

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
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "attr_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "cvalue_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "assay_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("phenotype_id");
__PACKAGE__->add_unique_constraint("phenotype_c1", ["uniquename"]);
__PACKAGE__->add_unique_constraint("phenotype_pkey", ["phenotype_id"]);
__PACKAGE__->has_many(
  "feature_phenotypes",
  "Chado::Schema::Phenotype::FeaturePhenotype",
  { "foreign.phenotype_id" => "self.phenotype_id" },
);
__PACKAGE__->has_many(
  "phenotype_cvterms",
  "Chado::Schema::Phenotype::PhenotypeCvterm",
  { "foreign.phenotype_id" => "self.phenotype_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GH3yAS9nTwgMqv6lQYWDXA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
