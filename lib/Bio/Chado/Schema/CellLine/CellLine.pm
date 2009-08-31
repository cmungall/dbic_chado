package Bio::Chado::Schema::CellLine::CellLine;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cell_line");
__PACKAGE__->add_columns(
  "cell_line_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_line_cell_line_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "uniquename",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "organism_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
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
__PACKAGE__->set_primary_key("cell_line_id");
__PACKAGE__->add_unique_constraint("cell_line_c1", ["uniquename", "organism_id"]);
__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
);
__PACKAGE__->has_many(
  "cell_line_cvterms",
  "Bio::Chado::Schema::CellLine::CellLineCvterm",
  { "foreign.cell_line_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_dbxrefs",
  "Bio::Chado::Schema::CellLine::CellLineDbxref",
  { "foreign.cell_line_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_features",
  "Bio::Chado::Schema::CellLine::CellLineFeature",
  { "foreign.cell_line_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_libraries",
  "Bio::Chado::Schema::CellLine::CellLineLibrary",
  { "foreign.cell_line_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_lineprops",
  "Bio::Chado::Schema::CellLine::CellLineprop",
  { "foreign.cell_line_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_pubs",
  "Bio::Chado::Schema::CellLine::CellLinePub",
  { "foreign.cell_line_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_relationship_subject_ids",
  "Bio::Chado::Schema::CellLine::CellLineRelationship",
  { "foreign.subject_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_relationship_object_ids",
  "Bio::Chado::Schema::CellLine::CellLineRelationship",
  { "foreign.object_id" => "self.cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_synonyms",
  "Bio::Chado::Schema::CellLine::CellLineSynonym",
  { "foreign.cell_line_id" => "self.cell_line_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gxcdw0sa+E9gEEUASAprCw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
