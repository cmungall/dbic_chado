package Bio::Chado::Schema::Phylogeny::Phylonode;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylonode");
__PACKAGE__->add_columns(
  "phylonode_id",
  {
    data_type => "integer",
    default_value => "nextval('phylonode_phylonode_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "phylotree_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "parent_phylonode_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "left_idx",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "right_idx",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "label",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "distance",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("phylonode_id");
__PACKAGE__->add_unique_constraint("phylonode_phylotree_id_key1", ["phylotree_id", "right_idx"]);
__PACKAGE__->add_unique_constraint("phylonode_phylotree_id_key", ["phylotree_id", "left_idx"]);
__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "parent_phylonode",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "parent_phylonode_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { "foreign.parent_phylonode_id" => "self.phylonode_id" },
);
__PACKAGE__->belongs_to(
  "phylotree",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { phylotree_id => "phylotree_id" },
);
__PACKAGE__->has_many(
  "phylonode_dbxrefs",
  "Bio::Chado::Schema::Phylogeny::PhylonodeDbxref",
  { "foreign.phylonode_id" => "self.phylonode_id" },
);
__PACKAGE__->might_have(
  "phylonode_organism",
  "Bio::Chado::Schema::Phylogeny::PhylonodeOrganism",
  { "foreign.phylonode_id" => "self.phylonode_id" },
);
__PACKAGE__->has_many(
  "phylonodeprops",
  "Bio::Chado::Schema::Phylogeny::Phylonodeprop",
  { "foreign.phylonode_id" => "self.phylonode_id" },
);
__PACKAGE__->has_many(
  "phylonode_pubs",
  "Bio::Chado::Schema::Phylogeny::PhylonodePub",
  { "foreign.phylonode_id" => "self.phylonode_id" },
);
__PACKAGE__->has_many(
  "phylonode_relationship_object_ids",
  "Bio::Chado::Schema::Phylogeny::PhylonodeRelationship",
  { "foreign.object_id" => "self.phylonode_id" },
);
__PACKAGE__->has_many(
  "phylonode_relationship_subject_ids",
  "Bio::Chado::Schema::Phylogeny::PhylonodeRelationship",
  { "foreign.subject_id" => "self.phylonode_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gw8sWvHMi0Q26KdIoMYvnA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
