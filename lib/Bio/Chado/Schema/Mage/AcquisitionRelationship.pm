package Bio::Chado::Schema::Mage::AcquisitionRelationship;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("acquisition_relationship");
__PACKAGE__->add_columns(
  "acquisition_relationship_id",
  {
    data_type => "integer",
    default_value => "nextval('acquisition_relationship_acquisition_relationship_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "subject_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "object_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("acquisition_relationship_id");
__PACKAGE__->add_unique_constraint(
  "acquisition_relationship_c1",
  ["subject_id", "object_id", "type_id", "rank"],
);
__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Mage::Acquisition",
  { acquisition_id => "subject_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Mage::Acquisition",
  { acquisition_id => "object_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MLE0BvYSzmS+ksiQYqiu0A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
