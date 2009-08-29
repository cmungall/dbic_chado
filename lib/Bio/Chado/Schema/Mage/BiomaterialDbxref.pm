package Bio::Chado::Schema::Mage::BiomaterialDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("biomaterial_dbxref");
__PACKAGE__->add_columns(
  "biomaterial_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('biomaterial_dbxref_biomaterial_dbxref_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "biomaterial_id",
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
__PACKAGE__->set_primary_key("biomaterial_dbxref_id");
__PACKAGE__->add_unique_constraint("biomaterial_dbxref_c1", ["biomaterial_id", "dbxref_id"]);
__PACKAGE__->belongs_to(
  "biomaterial",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VJV8mjbVT4XfIFp12/BAeQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
