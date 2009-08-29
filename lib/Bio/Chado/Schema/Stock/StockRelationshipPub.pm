package Bio::Chado::Schema::Stock::StockRelationshipPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stock_relationship_pub");
__PACKAGE__->add_columns(
  "stock_relationship_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('stock_relationship_pub_stock_relationship_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "stock_relationship_id",
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
__PACKAGE__->set_primary_key("stock_relationship_pub_id");
__PACKAGE__->add_unique_constraint(
  "stock_relationship_pub_c1",
  ["stock_relationship_id", "pub_id"],
);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "stock_relationship",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "stock_relationship_id" => "stock_relationship_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vf/EFFgss27OfMijhbR8BQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
