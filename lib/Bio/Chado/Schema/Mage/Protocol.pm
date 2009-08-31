package Bio::Chado::Schema::Mage::Protocol;

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
  "Bio::Chado::Schema::Mage::Acquisition",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "arraydesigns",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->has_many(
  "protocolparams",
  "Bio::Chado::Schema::Mage::Protocolparam",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Mage::Quantification",
  { "foreign.protocol_id" => "self.protocol_id" },
);
__PACKAGE__->has_many(
  "treatments",
  "Bio::Chado::Schema::Mage::Treatment",
  { "foreign.protocol_id" => "self.protocol_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UICnjtMNbovkZLXktHpajQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
