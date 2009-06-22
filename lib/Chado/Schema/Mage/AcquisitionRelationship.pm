package Chado::Schema::Mage::AcquisitionRelationship;

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
    is_nullable => 0,
    size => 4,
  },
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
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
__PACKAGE__->add_unique_constraint(
  "acquisition_relationship_pkey",
  ["acquisition_relationship_id"],
);
__PACKAGE__->belongs_to(
  "subject_id",
  "Chado::Schema::Mage::Acquisition",
  { acquisition_id => "subject_id" },
);
__PACKAGE__->belongs_to(
  "object_id",
  "Chado::Schema::Mage::Acquisition",
  { acquisition_id => "object_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OlrPgGSdrMf5402t3odsWA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
