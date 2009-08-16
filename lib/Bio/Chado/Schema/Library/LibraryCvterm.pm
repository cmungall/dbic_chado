package Bio::Chado::Schema::Library::LibraryCvterm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("library_cvterm");
__PACKAGE__->add_columns(
  "library_cvterm_id",
  {
    data_type => "integer",
    default_value => "nextval('library_cvterm_library_cvterm_id_seq'::regclass)",
    is_auto_increment => 1,
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
  "cvterm_id",
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
);
__PACKAGE__->set_primary_key("library_cvterm_id");
__PACKAGE__->add_unique_constraint("library_cvterm_c1", ["library_id", "cvterm_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "library",
  "Bio::Chado::Schema::Library::Library",
  { library_id => "library_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ejai/dSjEG39y0OYAYzCVw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
