package Bio::Chado::Schema::Mage::Study;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("study");
__PACKAGE__->add_columns(
  "study_id",
  {
    data_type => "integer",
    default_value => "nextval('study_study_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "contact_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("study_id");
__PACKAGE__->add_unique_constraint("study_c1", ["name"]);
__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "contact",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "contact_id" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "study_assays",
  "Bio::Chado::Schema::Mage::StudyAssay",
  { "foreign.study_id" => "self.study_id" },
);
__PACKAGE__->has_many(
  "studydesigns",
  "Bio::Chado::Schema::Mage::Studydesign",
  { "foreign.study_id" => "self.study_id" },
);
__PACKAGE__->has_many(
  "studyprops",
  "Bio::Chado::Schema::Mage::Studyprop",
  { "foreign.study_id" => "self.study_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SG7RwKsSsOIfJ2VnhLzldg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
