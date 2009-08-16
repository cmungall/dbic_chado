package Bio::Chado::Schema::Stock::StockpropPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stockprop_pub");
__PACKAGE__->add_columns(
  "stockprop_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('stockprop_pub_stockprop_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "stockprop_id",
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
__PACKAGE__->set_primary_key("stockprop_pub_id");
__PACKAGE__->add_unique_constraint("stockprop_pub_c1", ["stockprop_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "stockprop",
  "Bio::Chado::Schema::Stock::Stockprop",
  { stockprop_id => "stockprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LuM3nkmJSK81YHwOAf1pGw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
