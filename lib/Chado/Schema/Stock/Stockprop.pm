package Chado::Schema::Stock::Stockprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stockprop");
__PACKAGE__->add_columns(
  "stockprop_id",
  {
    data_type => "integer",
    default_value => "nextval('stockprop_stockprop_id_seq'::regclass)",
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
__PACKAGE__->set_primary_key("stockprop_id");
__PACKAGE__->add_unique_constraint("stockprop_c1", ["stock_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "stock",
  "Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
);
__PACKAGE__->has_many(
  "stockprop_pubs",
  "Chado::Schema::Stock::StockpropPub",
  { "foreign.stockprop_id" => "self.stockprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5Q1jul1sbvHIgYCpRuWRMQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
