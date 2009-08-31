package Bio::Chado::Schema::CellLine::CellLineprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cell_lineprop");
__PACKAGE__->add_columns(
  "cell_lineprop_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_lineprop_cell_lineprop_id_seq'::regclass)",
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
__PACKAGE__->set_primary_key("cell_lineprop_id");
__PACKAGE__->add_unique_constraint("cell_lineprop_c1", ["cell_line_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "cell_line",
  "Bio::Chado::Schema::CellLine::CellLine",
  { cell_line_id => "cell_line_id" },
);
__PACKAGE__->has_many(
  "cell_lineprop_pubs",
  "Bio::Chado::Schema::CellLine::CellLinepropPub",
  { "foreign.cell_lineprop_id" => "self.cell_lineprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C4arxX5HgLiPCzPAzoLWhw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
