package Bio::Chado::Schema::CellLine::CellLineSynonym;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cell_line_synonym");
__PACKAGE__->add_columns(
  "cell_line_synonym_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_line_synonym_cell_line_synonym_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "cell_line_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
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
    default_value => "false",
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
__PACKAGE__->set_primary_key("cell_line_synonym_id");
__PACKAGE__->add_unique_constraint(
  "cell_line_synonym_c1",
  ["synonym_id", "cell_line_id", "pub_id"],
);
__PACKAGE__->belongs_to(
  "synonym",
  "Bio::Chado::Schema::Sequence::Synonym",
  { synonym_id => "synonym_id" },
);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "cell_line",
  "Bio::Chado::Schema::CellLine::CellLine",
  { cell_line_id => "cell_line_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oVxFHetrgyA7RIBp2aDW5A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
