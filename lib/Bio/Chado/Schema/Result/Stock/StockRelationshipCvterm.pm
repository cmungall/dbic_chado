package Bio::Chado::Schema::Result::Stock::StockRelationshipCvterm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Result::Stock::StockRelationshipCvterm

=head1 DESCRIPTION

For germplasm maintenance and pedigree data, stock_relationship. type_id will record cvterms such as "is a female parent of", "a parent for mutation", "is a group_id of", "is a source_id of", etc The cvterms for higher categories such as "generative", "derivative" or "maintenance" can be stored in table stock_relationship_cvterm

=cut

__PACKAGE__->table("stock_relationship_cvterm");

=head1 ACCESSORS

=head2 stock_relationship_cvterm_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stock_relationship_cvterm_stock_relationship_cvterm_id_seq'

=head2 stock_relationship_id

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
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "stock_relationship_cvterm_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stock_relationship_cvterm_stock_relationship_cvterm_id_seq",
  },
  "stock_relationship_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "cvterm_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("stock_relationship_cvterm_id");

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Result::Pub::Pub",
  { pub_id => "pub_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 stock_relationship

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Stock::StockRelationship>

=cut

__PACKAGE__->belongs_to(
  "stock_relationship",
  "Bio::Chado::Schema::Result::Stock::StockRelationship",
  { stock_relationship_id => "stock_relationship_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-09-22 08:45:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hj9EypW2m0TmbYJV1YSivA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
