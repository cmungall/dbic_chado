package Chado::Schema::Phylogeny::PhylotreePub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylotree_pub");
__PACKAGE__->add_columns(
  "phylotree_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('phylotree_pub_phylotree_pub_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "phylotree_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("phylotree_pub_id");
__PACKAGE__->add_unique_constraint("phylotree_pub_pkey", ["phylotree_pub_id"]);
__PACKAGE__->add_unique_constraint("phylotree_pub_phylotree_id_key", ["phylotree_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "phylotree_id",
  "Chado::Schema::Phylogeny::Phylotree",
  { phylotree_id => "phylotree_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u9iJYGDgxXZq+dewCrF3Rw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
