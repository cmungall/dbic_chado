package Bio::Chado::Schema::General::DbDbxrefCount;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("db_dbxref_count");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "num_dbxrefs",
  { data_type => "bigint", default_value => undef, is_nullable => 1, size => 8 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FlBQAClqnQOUmPGvbGsolA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
