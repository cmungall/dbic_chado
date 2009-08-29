package Bio::Chado::Schema::Phylogeny::Phylonodeprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylonodeprop");
__PACKAGE__->add_columns(
  "phylonodeprop_id",
  {
    data_type => "integer",
    default_value => "nextval('phylonodeprop_phylonodeprop_id_seq'::regclass)",
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
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => "''::text",
    is_nullable => 0,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("phylonodeprop_id");
__PACKAGE__->add_unique_constraint(
  "phylonodeprop_phylonode_id_key",
  ["phylonode_id", "type_id", "value", "rank"],
);
__PACKAGE__->belongs_to(
  "phylonode",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "phylonode_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4jpIQ5OIlf8o3/MFjd3XsA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
