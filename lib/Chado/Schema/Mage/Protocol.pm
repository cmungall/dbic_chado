package Chado::Schema::Mage::Protocol;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("protocol");
__PACKAGE__->add_columns(
  "protocol_id",
  {
    data_type => "integer",
    default_value => "nextval('protocol_protocol_id_seq'::regclass)",
    is_auto_increment => 1,
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
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "uri",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "protocoldescription",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "hardwaredescription",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "softwaredescription",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("protocol_id");
__PACKAGE__->add_unique_constraint("protocol_c1", ["name"]);
__PACKAGE__->has_many(
  "acquisitions",
  "Chado::Schema::Mage::Acquisition",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "arraydesigns",
  "Chado::Schema::Mage::Arraydesign",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "assays",
  "Chado::Schema::Mage::Assay",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "protocolparams",
  "Chado::Schema::Mage::Protocolparam",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "quantifications",
  "Chado::Schema::Mage::Quantification",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "treatments",
  "Chado::Schema::Mage::Treatment",
  { "foreign.protocol_id" => "self.protocol_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3UlV6DG3iglcwsSwjkIlHA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
