package Bio::Chado::Schema::Stock::StockpropPub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::StockpropPub

=head1 DESCRIPTION

Provenance. Any stockprop assignment can optionally be supported by a publication.

=cut

__PACKAGE__->table("stockprop_pub");

=head1 ACCESSORS

=head2 stockprop_pub_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stockprop_pub_stockprop_pub_id_seq'

=head2 stockprop_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "stockprop_pub_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stockprop_pub_stockprop_pub_id_seq",
  },
  "stockprop_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("stockprop_pub_id");
__PACKAGE__->add_unique_constraint("stockprop_pub_c1", ["stockprop_id", "pub_id"]);

=head1 RELATIONS

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

=head2 stockprop

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stockprop>

=cut

__PACKAGE__->belongs_to(
  "stockprop",
  "Bio::Chado::Schema::Stock::Stockprop",
  { stockprop_id => "stockprop_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1g20pM48X4YTeT2KiCB0jg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
