package Bio::Chado::Schema::Mage::Studydesignprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studydesignprop");
__PACKAGE__->add_columns(
  "studydesignprop_id",
  {
    data_type => "integer",
    default_value => "nextval('studydesignprop_studydesignprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "studydesign_id",
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
__PACKAGE__->set_primary_key("studydesignprop_id");
__PACKAGE__->add_unique_constraint("studydesignprop_c1", ["studydesign_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "studydesign",
  "Bio::Chado::Schema::Mage::Studydesign",
  { studydesign_id => "studydesign_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s+QCxJNKkamun8riN4rf3g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
