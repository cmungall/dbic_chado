package Chado::Schema::Organism::OrganismDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("organism_dbxref");
__PACKAGE__->add_columns(
  "organism_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('organism_dbxref_organism_dbxref_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "organism_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("organism_dbxref_id");
__PACKAGE__->add_unique_constraint("organism_dbxref_pkey", ["organism_dbxref_id"]);
__PACKAGE__->add_unique_constraint("organism_dbxref_c1", ["organism_id", "dbxref_id"]);
__PACKAGE__->belongs_to(
  "organism_id",
  "Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:j5WlR0/ECQeODbl5HSaPQQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
