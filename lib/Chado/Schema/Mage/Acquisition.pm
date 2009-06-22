package Chado::Schema::Mage::Acquisition;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("acquisition");
__PACKAGE__->add_columns(
  "acquisition_id",
  {
    data_type => "integer",
    default_value => "nextval('acquisition_acquisition_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "assay_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "protocol_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "channel_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "acquisitiondate",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 1,
    size => 8,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "uri",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("acquisition_id");
__PACKAGE__->add_unique_constraint("acquisition_pkey", ["acquisition_id"]);
__PACKAGE__->add_unique_constraint("acquisition_c1", ["name"]);
__PACKAGE__->belongs_to(
  "protocol_id",
  "Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
);
__PACKAGE__->belongs_to(
  "assay_id",
  "Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);
__PACKAGE__->belongs_to(
  "channel_id",
  "Chado::Schema::Mage::Channel",
  { channel_id => "channel_id" },
);
__PACKAGE__->has_many(
  "acquisitionprops",
  "Chado::Schema::Mage::Acquisitionprop",
  { "foreign.acquisition_id" => "self.acquisition_id" },
);
__PACKAGE__->has_many(
  "acquisition_relationship_subject_ids",
  "Chado::Schema::Mage::AcquisitionRelationship",
  { "foreign.subject_id" => "self.acquisition_id" },
);
__PACKAGE__->has_many(
  "acquisition_relationship_object_ids",
  "Chado::Schema::Mage::AcquisitionRelationship",
  { "foreign.object_id" => "self.acquisition_id" },
);
__PACKAGE__->has_many(
  "quantifications",
  "Chado::Schema::Mage::Quantification",
  { "foreign.acquisition_id" => "self.acquisition_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lT+93zMIjKxyrMlcWo7fwA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
