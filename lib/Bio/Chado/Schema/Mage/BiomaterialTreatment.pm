package Bio::Chado::Schema::Mage::BiomaterialTreatment;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("biomaterial_treatment");
__PACKAGE__->add_columns(
  "biomaterial_treatment_id",
  {
    data_type => "integer",
    default_value => "nextval('biomaterial_treatment_biomaterial_treatment_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "biomaterial_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "treatment_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "unittype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "value",
  { data_type => "real", default_value => undef, is_nullable => 1, size => 4 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("biomaterial_treatment_id");
__PACKAGE__->add_unique_constraint(
  "biomaterial_treatment_c1",
  ["biomaterial_id", "treatment_id"],
);
__PACKAGE__->belongs_to(
  "biomaterial",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
);
__PACKAGE__->belongs_to(
  "unittype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "unittype_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "treatment",
  "Bio::Chado::Schema::Mage::Treatment",
  { treatment_id => "treatment_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Vh0QkS7yxm7QUYbcmZHfjA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
