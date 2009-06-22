package Chado::Schema::Library::Library;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("library");
__PACKAGE__->add_columns(
  "library_id",
  {
    data_type => "integer",
    default_value => "nextval('library_library_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "organism_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "is_obsolete",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
  "timeaccessioned",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
  "timelastmodified",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("library_id");
__PACKAGE__->add_unique_constraint("library_c1", ["organism_id", "uniquename", "type_id"]);
__PACKAGE__->add_unique_constraint("library_pkey", ["library_id"]);
__PACKAGE__->has_many(
  "library_cvterms",
  "Chado::Schema::Library::LibraryCvterm",
  { "foreign.library_id" => "self.library_id" },
);
__PACKAGE__->has_many(
  "library_dbxrefs",
  "Chado::Schema::Library::LibraryDbxref",
  { "foreign.library_id" => "self.library_id" },
);
__PACKAGE__->has_many(
  "library_features",
  "Chado::Schema::Library::LibraryFeature",
  { "foreign.library_id" => "self.library_id" },
);
__PACKAGE__->has_many(
  "libraryprops",
  "Chado::Schema::Library::Libraryprop",
  { "foreign.library_id" => "self.library_id" },
);
__PACKAGE__->has_many(
  "library_pubs",
  "Chado::Schema::Library::LibraryPub",
  { "foreign.library_id" => "self.library_id" },
);
__PACKAGE__->has_many(
  "library_synonyms",
  "Chado::Schema::Library::LibrarySynonym",
  { "foreign.library_id" => "self.library_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LrldPoiYJRpfpFEY/TACAw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
