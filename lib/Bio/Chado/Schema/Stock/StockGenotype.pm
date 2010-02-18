package Bio::Chado::Schema::Stock::StockGenotype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::StockGenotype

=head1 DESCRIPTION

Simple table linking a stock to
a genotype. Features with genotypes can be linked to stocks thru feature_genotype -> genotype -> stock_genotype -> stock.

=cut

__PACKAGE__->table("stock_genotype");

=head1 ACCESSORS

=head2 stock_genotype_id

  data_type: integer
  default_value: nextval('stock_genotype_stock_genotype_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 stock_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 genotype_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "stock_genotype_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('stock_genotype_stock_genotype_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "stock_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "genotype_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("stock_genotype_id");
__PACKAGE__->add_unique_constraint("stock_genotype_c1", ["stock_id", "genotype_id"]);

=head1 RELATIONS

=head2 genotype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Genetic::Genotype>

=cut

__PACKAGE__->belongs_to(
  "genotype",
  "Bio::Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AEClo7RZ1CH3gISidKzzVg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
