package Bio::Chado::Schema::Mage::Acquisition;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "assay_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "protocol_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "channel_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
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
__PACKAGE__->add_unique_constraint("acquisition_c1", ["name"]);
__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);
__PACKAGE__->belongs_to(
  "channel",
  "Bio::Chado::Schema::Mage::Channel",
  { channel_id => "channel_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "acquisitionprops",
  "Bio::Chado::Schema::Mage::Acquisitionprop",
  { "foreign.acquisition_id" => "self.acquisition_id" },
);
__PACKAGE__->has_many(
  "acquisition_relationship_subject_ids",
  "Bio::Chado::Schema::Mage::AcquisitionRelationship",
  { "foreign.subject_id" => "self.acquisition_id" },
);
__PACKAGE__->has_many(
  "acquisition_relationship_object_ids",
  "Bio::Chado::Schema::Mage::AcquisitionRelationship",
  { "foreign.object_id" => "self.acquisition_id" },
);
__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Mage::Quantification",
  { "foreign.acquisition_id" => "self.acquisition_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sY/jo8nXJ5cxb+wDtcEX6Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
