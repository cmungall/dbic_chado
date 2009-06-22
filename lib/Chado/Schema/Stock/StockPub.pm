package Chado::Schema::Stock::StockPub;

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
    is_nullable => 0,
    size => 4,
  },
  "stock_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("stock_pub_id");
__PACKAGE__->add_unique_constraint("stock_pub_pkey", ["stock_pub_id"]);
__PACKAGE__->add_unique_constraint("stock_pub_c1", ["stock_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "stock_id",
  "Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jcJMYLhRVbWRsqZiNMjqWw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
