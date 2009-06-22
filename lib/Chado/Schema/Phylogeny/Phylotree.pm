package Chado::Schema::Phylogeny::Phylotree;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylotree");
__PACKAGE__->add_columns(
  "phylotree_id",
  {
    data_type => "integer",
    default_value => "nextval('phylotree_phylotree_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "analysis_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "comment",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("phylotree_id");
__PACKAGE__->add_unique_constraint("phylotree_pkey", ["phylotree_id"]);
__PACKAGE__->has_many(
  "phylonodes",
  "Chado::Schema::Phylogeny::Phylonode",
  { "foreign.phylotree_id" => "self.phylotree_id" },
);
__PACKAGE__->has_many(
  "phylonode_relationships",
  "Chado::Schema::Phylogeny::PhylonodeRelationship",
  { "foreign.phylotree_id" => "self.phylotree_id" },
);
__PACKAGE__->has_many(
  "phylotree_pubs",
  "Chado::Schema::Phylogeny::PhylotreePub",
  { "foreign.phylotree_id" => "self.phylotree_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HZJKi87/9CX09ORkMLRH0g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
