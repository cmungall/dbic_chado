package Bio::Chado::Schema::Stock::StockCvterm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::StockCvterm

=head1 DESCRIPTION

stock_cvterm links a stock to cvterms. This is for secondary cvterms; primary cvterms should use stock.type_id.

=cut

__PACKAGE__->table("stock_cvterm");

=head1 ACCESSORS

=head2 stock_cvterm_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stock_cvterm_stock_cvterm_id_seq'

=head2 stock_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 cvterm_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "stock_cvterm_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stock_cvterm_stock_cvterm_id_seq",
  },
  "stock_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "cvterm_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("stock_cvterm_id");
__PACKAGE__->add_unique_constraint("stock_cvterm_c1", ["stock_id", "cvterm_id", "pub_id"]);

=head1 RELATIONS

=head2 cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 stock

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stock>

=cut

__PACKAGE__->belongs_to(
  "stock",
  "Bio::Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:p6tR85c1LZevOnmLQzKWCw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
