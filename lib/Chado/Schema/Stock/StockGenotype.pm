package Chado::Schema::Stock::StockGenotype;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stock_genotype");
__PACKAGE__->add_columns(
  "stock_genotype_id",
  {
    data_type => "integer",
    default_value => "nextval('stock_genotype_stock_genotype_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "stock_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "genotype_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("stock_genotype_id");
__PACKAGE__->add_unique_constraint("stock_genotype_c1", ["stock_id", "genotype_id"]);
__PACKAGE__->add_unique_constraint("stock_genotype_pkey", ["stock_genotype_id"]);
__PACKAGE__->belongs_to(
  "stock_id",
  "Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Iz4QF7nAd8Mg8ZxYW5NXLQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
