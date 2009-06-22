package Chado::Schema::Phenotype::FeaturePhenotype;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_phenotype");
__PACKAGE__->add_columns(
  "feature_phenotype_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_phenotype_feature_phenotype_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "phenotype_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("feature_phenotype_id");
__PACKAGE__->add_unique_constraint("feature_phenotype_pkey", ["feature_phenotype_id"]);
__PACKAGE__->add_unique_constraint("feature_phenotype_c1", ["feature_id", "phenotype_id"]);
__PACKAGE__->belongs_to(
  "phenotype_id",
  "Chado::Schema::Phenotype::Phenotype",
  { phenotype_id => "phenotype_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Kz9kHV9En9vLhcVCD+cWzA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
