package Bio::Chado::Schema::Stock::StockcollectionStock;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::StockcollectionStock - stockcollection_stock links
a stock collection to the stocks which are contained in the collection.

=cut

__PACKAGE__->table("stockcollection_stock");

=head1 ACCESSORS

=head2 stockcollection_stock_id

  data_type: integer
  default_value: nextval('stockcollection_stock_stockcollection_stock_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 stockcollection_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 stock_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "stockcollection_stock_id",
  {
    data_type => "integer",
    default_value => "nextval('stockcollection_stock_stockcollection_stock_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "stockcollection_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
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
);
__PACKAGE__->set_primary_key("stockcollection_stock_id");
__PACKAGE__->add_unique_constraint(
  "stockcollection_stock_c1",
  ["stockcollection_id", "stock_id"],
);

=head1 RELATIONS

=head2 stock

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stock>

=cut

__PACKAGE__->belongs_to(
  "stock",
  "Bio::Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stockcollection

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stockcollection>

=cut

__PACKAGE__->belongs_to(
  "stockcollection",
  "Bio::Chado::Schema::Stock::Stockcollection",
  { stockcollection_id => "stockcollection_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MjJPPzDg+SpcLeOk33bC5Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
