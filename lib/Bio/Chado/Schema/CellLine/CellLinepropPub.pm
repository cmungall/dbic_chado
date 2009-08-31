package Bio::Chado::Schema::CellLine::CellLinepropPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cell_lineprop_pub");
__PACKAGE__->add_columns(
  "cell_lineprop_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_lineprop_pub_cell_lineprop_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "cell_lineprop_id",
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
__PACKAGE__->set_primary_key("cell_lineprop_pub_id");
__PACKAGE__->add_unique_constraint("cell_lineprop_pub_c1", ["cell_lineprop_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "cell_lineprop",
  "Bio::Chado::Schema::CellLine::CellLineprop",
  { cell_lineprop_id => "cell_lineprop_id" },
);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DOMn6XMYMwtHee92ZiAn3g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
