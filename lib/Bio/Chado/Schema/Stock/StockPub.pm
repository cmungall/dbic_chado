package Bio::Chado::Schema::Stock::StockPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stock_pub");
__PACKAGE__->add_columns(
  "stock_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('stock_pub_stock_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "stock_id",
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
__PACKAGE__->set_primary_key("stock_pub_id");
__PACKAGE__->add_unique_constraint("stock_pub_c1", ["stock_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "stock",
  "Bio::Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Uom3zlIJSxTnJI7sFYWoCw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
