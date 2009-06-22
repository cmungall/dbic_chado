package Chado::Schema::Phylogeny::PhylonodeRelationship;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylonode_relationship");
__PACKAGE__->add_columns(
  "phylonode_relationship_id",
  {
    data_type => "integer",
    default_value => "nextval('phylonode_relationship_phylonode_relationship_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "rank",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "phylotree_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("phylonode_relationship_id");
__PACKAGE__->add_unique_constraint("phylonode_relationship_pkey", ["phylonode_relationship_id"]);
__PACKAGE__->add_unique_constraint(
  "phylonode_relationship_subject_id_key",
  ["subject_id", "object_id", "type_id"],
);
__PACKAGE__->belongs_to(
  "phylotree_id",
  "Chado::Schema::Phylogeny::Phylotree",
  { phylotree_id => "phylotree_id" },
);
__PACKAGE__->belongs_to(
  "object_id",
  "Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "object_id" },
);
__PACKAGE__->belongs_to(
  "subject_id",
  "Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "subject_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Vr7OzZ7lmlgdYWtUVk4OBw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
