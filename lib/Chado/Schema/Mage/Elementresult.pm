package Chado::Schema::Mage::Elementresult;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("elementresult");
__PACKAGE__->add_columns(
  "elementresult_id",
  {
    data_type => "integer",
    default_value => "nextval('elementresult_elementresult_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "element_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "quantification_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "signal",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("elementresult_id");
__PACKAGE__->add_unique_constraint("elementresult_c1", ["element_id", "quantification_id"]);
__PACKAGE__->add_unique_constraint("elementresult_pkey", ["elementresult_id"]);
__PACKAGE__->belongs_to(
  "element_id",
  "Chado::Schema::Mage::Element",
  { element_id => "element_id" },
);
__PACKAGE__->belongs_to(
  "quantification_id",
  "Chado::Schema::Mage::Quantification",
  { quantification_id => "quantification_id" },
);
__PACKAGE__->has_many(
  "elementresult_relationship_subject_ids",
  "Chado::Schema::Mage::ElementresultRelationship",
  { "foreign.subject_id" => "self.elementresult_id" },
);
__PACKAGE__->has_many(
  "elementresult_relationship_object_ids",
  "Chado::Schema::Mage::ElementresultRelationship",
  { "foreign.object_id" => "self.elementresult_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iujKn2YdUMpuPTmSBDwDmw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
