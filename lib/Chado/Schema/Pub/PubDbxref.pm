package Chado::Schema::Pub::PubDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("pub_dbxref");
__PACKAGE__->add_columns(
  "pub_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('pub_dbxref_pub_dbxref_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "is_current",
  {
    data_type => "boolean",
    default_value => "true",
    is_nullable => 0,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("pub_dbxref_id");
__PACKAGE__->add_unique_constraint("pub_dbxref_c1", ["pub_id", "dbxref_id"]);
__PACKAGE__->add_unique_constraint("pub_dbxref_pkey", ["pub_dbxref_id"]);
__PACKAGE__->belongs_to("pub_id", "Chado::Schema::Pub::Pub", { pub_id => "pub_id" });


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FVWI8mtw/1qMB5/e49sb8A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
