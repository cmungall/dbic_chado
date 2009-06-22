package Chado::Schema::Mage::StudyAssay;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("study_assay");
__PACKAGE__->add_columns(
  "study_assay_id",
  {
    data_type => "integer",
    default_value => "nextval('study_assay_study_assay_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "study_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "assay_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("study_assay_id");
__PACKAGE__->add_unique_constraint("study_assay_c1", ["study_id", "assay_id"]);
__PACKAGE__->add_unique_constraint("study_assay_pkey", ["study_assay_id"]);
__PACKAGE__->belongs_to(
  "study_id",
  "Chado::Schema::Mage::Study",
  { study_id => "study_id" },
);
__PACKAGE__->belongs_to(
  "assay_id",
  "Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qvv/01LQn84HKwUqD0gv6Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
