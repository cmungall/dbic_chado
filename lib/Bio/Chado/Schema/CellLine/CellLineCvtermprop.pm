package Bio::Chado::Schema::CellLine::CellLineCvtermprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cell_line_cvtermprop");
__PACKAGE__->add_columns(
  "cell_line_cvtermprop_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_line_cvtermprop_cell_line_cvtermprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "cell_line_cvterm_id",
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
__PACKAGE__->set_primary_key("cell_line_cvtermprop_id");
__PACKAGE__->add_unique_constraint(
  "cell_line_cvtermprop_c1",
  ["cell_line_cvterm_id", "type_id", "rank"],
);
__PACKAGE__->belongs_to(
  "cell_line_cvterm",
  "Bio::Chado::Schema::CellLine::CellLineCvterm",
  { cell_line_cvterm_id => "cell_line_cvterm_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wJ255pvQ5fjEvTvtORSNFQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
