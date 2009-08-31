package Bio::Chado::Schema::Mage::Quantification;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("quantification");
__PACKAGE__->add_columns(
  "quantification_id",
  {
    data_type => "integer",
    default_value => "nextval('quantification_quantification_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "acquisition_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "operator_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
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
  "analysis_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "quantificationdate",
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
__PACKAGE__->set_primary_key("quantification_id");
__PACKAGE__->add_unique_constraint("quantification_c1", ["name", "analysis_id"]);
__PACKAGE__->has_many(
  "elementresults",
  "Bio::Chado::Schema::Mage::Elementresult",
  { "foreign.quantification_id" => "self.quantification_id" },
);
__PACKAGE__->belongs_to(
  "operator",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "operator_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "analysis",
  "Bio::Chado::Schema::Companalysis::Analysis",
  { analysis_id => "analysis_id" },
);
__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "acquisition",
  "Bio::Chado::Schema::Mage::Acquisition",
  { acquisition_id => "acquisition_id" },
);
__PACKAGE__->has_many(
  "quantificationprops",
  "Bio::Chado::Schema::Mage::Quantificationprop",
  { "foreign.quantification_id" => "self.quantification_id" },
);
__PACKAGE__->has_many(
  "quantification_relationship_subject_ids",
  "Bio::Chado::Schema::Mage::QuantificationRelationship",
  { "foreign.subject_id" => "self.quantification_id" },
);
__PACKAGE__->has_many(
  "quantification_relationship_object_ids",
  "Bio::Chado::Schema::Mage::QuantificationRelationship",
  { "foreign.object_id" => "self.quantification_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RADqBeVyrbgiUKqhEEJ9Lg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
