package Chado::Schema::Cv::Cvterm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cvterm");
__PACKAGE__->add_columns(
  "cvterm_id",
  {
    data_type => "integer",
    default_value => "nextval('cvterm_cvterm_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "cv_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 1024,
  },
  "definition",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "is_obsolete",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
  "is_relationshiptype",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("cvterm_id");
__PACKAGE__->add_unique_constraint("cvterm_c2", ["dbxref_id"]);
__PACKAGE__->add_unique_constraint("cvterm_pkey", ["cvterm_id"]);
__PACKAGE__->add_unique_constraint("cvterm_c1", ["name", "cv_id", "is_obsolete"]);
__PACKAGE__->belongs_to("cv_id", "Chado::Schema::Cv::Cv", { cv_id => "cv_id" });
__PACKAGE__->has_many(
  "cvterm_dbxrefs",
  "Chado::Schema::Cv::CvtermDbxref",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermpath_type_ids",
  "Chado::Schema::Cv::Cvtermpath",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermpath_object_ids",
  "Chado::Schema::Cv::Cvtermpath",
  { "foreign.object_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermpath_subject_ids",
  "Chado::Schema::Cv::Cvtermpath",
  { "foreign.subject_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermprop_type_ids",
  "Chado::Schema::Cv::Cvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermprop_cvterm_ids",
  "Chado::Schema::Cv::Cvtermprop",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvterm_relationship_type_ids",
  "Chado::Schema::Cv::CvtermRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvterm_relationship_object_ids",
  "Chado::Schema::Cv::CvtermRelationship",
  { "foreign.object_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvterm_relationship_subject_ids",
  "Chado::Schema::Cv::CvtermRelationship",
  { "foreign.subject_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermsynonym_type_ids",
  "Chado::Schema::Cv::Cvtermsynonym",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermsynonym_cvterm_ids",
  "Chado::Schema::Cv::Cvtermsynonym",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "dbxrefprops",
  "Chado::Schema::Cv::Dbxrefprop",
  { "foreign.type_id" => "self.cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LN0EUv+zlXlyXstiS/OGag


# You can replace this text with custom content, and it will be preserved on regeneration
1;
