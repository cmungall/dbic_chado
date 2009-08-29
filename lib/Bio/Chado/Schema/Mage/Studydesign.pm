package Bio::Chado::Schema::Mage::Studydesign;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "study_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("studydesign_id");
__PACKAGE__->belongs_to(
  "study",
  "Bio::Chado::Schema::Mage::Study",
  { study_id => "study_id" },
);
__PACKAGE__->has_many(
  "studydesignprops",
  "Bio::Chado::Schema::Mage::Studydesignprop",
  { "foreign.studydesign_id" => "self.studydesign_id" },
);
__PACKAGE__->has_many(
  "studyfactors",
  "Bio::Chado::Schema::Mage::Studyfactor",
  { "foreign.studydesign_id" => "self.studydesign_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PAclBa6ma+0xFed2ApN1uA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
