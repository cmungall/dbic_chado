package Bio::Chado::Schema::Phylogeny::PhylotreePub;

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
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("phylotree_pub_id");
__PACKAGE__->add_unique_constraint("phylotree_pub_phylotree_id_key", ["phylotree_id", "pub_id"]);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "phylotree",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { phylotree_id => "phylotree_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:N37oode+utWG09+uX09UqQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
