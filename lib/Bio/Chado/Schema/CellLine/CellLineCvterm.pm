package Bio::Chado::Schema::CellLine::CellLineCvterm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cell_line_cvterm");
__PACKAGE__->add_columns(
  "cell_line_cvterm_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_line_cvterm_cell_line_cvterm_id_seq'::regclass)",
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
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("cell_line_cvterm_id");
__PACKAGE__->add_unique_constraint(
  "cell_line_cvterm_c1",
  ["cell_line_id", "cvterm_id", "pub_id", "rank"],
);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
);
__PACKAGE__->belongs_to(
  "cell_line",
  "Bio::Chado::Schema::CellLine::CellLine",
  { cell_line_id => "cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_line_cvtermprops",
  "Bio::Chado::Schema::CellLine::CellLineCvtermprop",
  { "foreign.cell_line_cvterm_id" => "self.cell_line_cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uBbkbruiBDRZ92syTOnWlQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
