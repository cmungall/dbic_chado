package Bio::Chado::Schema::Pub::PubRelationship;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("pub_relationship");
__PACKAGE__->add_columns(
  "pub_relationship_id",
  {
    data_type => "integer",
    default_value => "nextval('pub_relationship_pub_relationship_id_seq'::regclass)",
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
  "object_id",
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
);
__PACKAGE__->set_primary_key("pub_relationship_id");
__PACKAGE__->add_unique_constraint("pub_relationship_c1", ["subject_id", "object_id", "type_id"]);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "object_id" },
);
__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "subject_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:M29j5SBNGltCaG/Mcw/KjQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
