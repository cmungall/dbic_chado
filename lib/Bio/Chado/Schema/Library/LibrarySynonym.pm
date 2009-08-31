package Bio::Chado::Schema::Library::LibrarySynonym;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("library_synonym");
__PACKAGE__->add_columns(
  "library_synonym_id",
  {
    data_type => "integer",
    default_value => "nextval('library_synonym_library_synonym_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "synonym_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "library_id",
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
    is_nullable => 0,
    size => 4,
  },
  "is_current",
  {
    data_type => "boolean",
    default_value => "true",
    is_nullable => 0,
    size => 1,
  },
  "is_internal",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("library_synonym_id");
__PACKAGE__->add_unique_constraint("library_synonym_c1", ["synonym_id", "library_id", "pub_id"]);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "library",
  "Bio::Chado::Schema::Library::Library",
  { library_id => "library_id" },
);
__PACKAGE__->belongs_to(
  "synonym",
  "Bio::Chado::Schema::Sequence::Synonym",
  { synonym_id => "synonym_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:csOk3jrm/I0u2b6On/lAkg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
