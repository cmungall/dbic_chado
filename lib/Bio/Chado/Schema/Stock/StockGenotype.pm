package Bio::Chado::Schema::Stock::StockGenotype;

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
  "genotype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("stock_genotype_id");
__PACKAGE__->add_unique_constraint("stock_genotype_c1", ["stock_id", "genotype_id"]);
__PACKAGE__->belongs_to(
  "genotype",
  "Bio::Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype_id" },
);
__PACKAGE__->belongs_to(
  "stock",
  "Bio::Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5ageXLW2JYbW2yt7uVkFyA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
