package Chado::Schema::Library::LibrarypropPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("libraryprop_pub");
__PACKAGE__->add_columns(
  "libraryprop_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('libraryprop_pub_libraryprop_pub_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "libraryprop_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("libraryprop_pub_id");
__PACKAGE__->add_unique_constraint("libraryprop_pub_c1", ["libraryprop_id", "pub_id"]);
__PACKAGE__->add_unique_constraint("libraryprop_pub_pkey", ["libraryprop_pub_id"]);
__PACKAGE__->belongs_to(
  "libraryprop_id",
  "Chado::Schema::Library::Libraryprop",
  { libraryprop_id => "libraryprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JbnB09NKLo01GbCrMqzUUQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
