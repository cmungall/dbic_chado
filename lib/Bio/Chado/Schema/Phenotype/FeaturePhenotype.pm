package Bio::Chado::Schema::Phenotype::FeaturePhenotype;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "phenotype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("feature_phenotype_id");
__PACKAGE__->add_unique_constraint("feature_phenotype_c1", ["feature_id", "phenotype_id"]);
__PACKAGE__->belongs_to(
  "phenotype",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { phenotype_id => "phenotype_id" },
);
__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sF8jsFVWP5lM35ymovu3mA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
