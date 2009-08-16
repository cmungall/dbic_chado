package Bio::Chado::Schema::Phylogeny::PhylonodeDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylonode_dbxref");
__PACKAGE__->add_columns(
  "phylonode_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('phylonode_dbxref_phylonode_dbxref_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "phylonode_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("phylonode_dbxref_id");
__PACKAGE__->add_unique_constraint(
  "phylonode_dbxref_phylonode_id_key",
  ["phylonode_id", "dbxref_id"],
);
__PACKAGE__->belongs_to(
  "phylonode",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "phylonode_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2nVW/tiKR3q2FydzB7CdLw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
