package Chado::Schema::Mage::Studydesign;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studydesign");
__PACKAGE__->add_columns(
  "studydesign_id",
  {
    data_type => "integer",
    default_value => "nextval('studydesign_studydesign_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "study_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("studydesign_id");
__PACKAGE__->add_unique_constraint("studydesign_pkey", ["studydesign_id"]);
__PACKAGE__->belongs_to(
  "study_id",
  "Chado::Schema::Mage::Study",
  { study_id => "study_id" },
);
__PACKAGE__->has_many(
  "studydesignprops",
  "Chado::Schema::Mage::Studydesignprop",
  { "foreign.studydesign_id" => "self.studydesign_id" },
);
__PACKAGE__->has_many(
  "studyfactors",
  "Chado::Schema::Mage::Studyfactor",
  { "foreign.studydesign_id" => "self.studydesign_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:syn3dq4c2I2+Rw6ktAFCkw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
