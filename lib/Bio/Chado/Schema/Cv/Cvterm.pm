package Bio::Chado::Schema::Cv::Cvterm;

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
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "cv_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
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
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_obsolete",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
  "is_relationshiptype",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("cvterm_id");
__PACKAGE__->add_unique_constraint("cvterm_c2", ["dbxref_id"]);
__PACKAGE__->add_unique_constraint("cvterm_c1", ["name", "cv_id", "is_obsolete"]);
__PACKAGE__->has_many(
  "acquisitionprops",
  "Bio::Chado::Schema::Mage::Acquisitionprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "acquisition_relationships",
  "Bio::Chado::Schema::Mage::AcquisitionRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "analysisprops",
  "Bio::Chado::Schema::Companalysis::Analysisprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "arraydesign_platformtype_ids",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { "foreign.platformtype_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "arraydesign_substratetype_ids",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { "foreign.substratetype_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "arraydesignprops",
  "Bio::Chado::Schema::Mage::Arraydesignprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "assayprops",
  "Bio::Chado::Schema::Mage::Assayprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "biomaterialprops",
  "Bio::Chado::Schema::Mage::Biomaterialprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "biomaterial_relationships",
  "Bio::Chado::Schema::Mage::BiomaterialRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "biomaterial_treatments",
  "Bio::Chado::Schema::Mage::BiomaterialTreatment",
  { "foreign.unittype_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "contacts",
  "Bio::Chado::Schema::Contact::Contact",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "contact_relationships",
  "Bio::Chado::Schema::Contact::ContactRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "controls",
  "Bio::Chado::Schema::Mage::Control",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->belongs_to("cv", "Bio::Chado::Schema::Cv::Cv", { cv_id => "cv_id" });
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
);
__PACKAGE__->has_many(
  "cvterm_dbxrefs",
  "Bio::Chado::Schema::Cv::CvtermDbxref",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermpath_type_ids",
  "Bio::Chado::Schema::Cv::Cvtermpath",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermpath_object_ids",
  "Bio::Chado::Schema::Cv::Cvtermpath",
  { "foreign.object_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermpath_subject_ids",
  "Bio::Chado::Schema::Cv::Cvtermpath",
  { "foreign.subject_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermprop_type_ids",
  "Bio::Chado::Schema::Cv::Cvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermprop_cvterm_ids",
  "Bio::Chado::Schema::Cv::Cvtermprop",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvterm_relationship_type_ids",
  "Bio::Chado::Schema::Cv::CvtermRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvterm_relationship_object_ids",
  "Bio::Chado::Schema::Cv::CvtermRelationship",
  { "foreign.object_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvterm_relationship_subject_ids",
  "Bio::Chado::Schema::Cv::CvtermRelationship",
  { "foreign.subject_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermsynonym_type_ids",
  "Bio::Chado::Schema::Cv::Cvtermsynonym",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cvtermsynonym_cvterm_ids",
  "Bio::Chado::Schema::Cv::Cvtermsynonym",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "dbxrefprops",
  "Bio::Chado::Schema::Cv::Dbxrefprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "element_relationships",
  "Bio::Chado::Schema::Mage::ElementRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "elementresult_relationships",
  "Bio::Chado::Schema::Mage::ElementresultRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "environment_cvterms",
  "Bio::Chado::Schema::Genetic::EnvironmentCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "expression_cvterm_cvterm_ids",
  "Bio::Chado::Schema::Expression::ExpressionCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "expression_cvterm_cvterm_type_ids",
  "Bio::Chado::Schema::Expression::ExpressionCvterm",
  { "foreign.cvterm_type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "expression_cvtermprops",
  "Bio::Chado::Schema::Expression::ExpressionCvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "expressionprops",
  "Bio::Chado::Schema::Expression::Expressionprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "features",
  "Bio::Chado::Schema::Sequence::Feature",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_cvterms",
  "Bio::Chado::Schema::Sequence::FeatureCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_cvtermprops",
  "Bio::Chado::Schema::Sequence::FeatureCvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_expressionprops",
  "Bio::Chado::Schema::Expression::FeatureExpressionprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_genotypes",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "featuremaps",
  "Bio::Chado::Schema::Map::Featuremap",
  { "foreign.unittype_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "featureprops",
  "Bio::Chado::Schema::Sequence::Featureprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_pubprops",
  "Bio::Chado::Schema::Sequence::FeaturePubprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_relationships",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "feature_relationshipprops",
  "Bio::Chado::Schema::Sequence::FeatureRelationshipprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "libraries",
  "Bio::Chado::Schema::Library::Library",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "library_cvterms",
  "Bio::Chado::Schema::Library::LibraryCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "libraryprops",
  "Bio::Chado::Schema::Library::Libraryprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "organismprops",
  "Bio::Chado::Schema::Organism::Organismprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Genetic::Phendesc",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phenotype_assay_ids",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { "foreign.assay_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phenotype_attr_ids",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { "foreign.attr_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phenotype_observable_ids",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { "foreign.observable_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phenotype_cvalue_ids",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { "foreign.cvalue_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_cvterms",
  "Bio::Chado::Schema::Genetic::PhenotypeComparisonCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phenotype_cvterms",
  "Bio::Chado::Schema::Phenotype::PhenotypeCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phylonodeprops",
  "Bio::Chado::Schema::Phylogeny::Phylonodeprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phylonode_relationships",
  "Bio::Chado::Schema::Phylogeny::PhylonodeRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "phylotrees",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "protocols",
  "Bio::Chado::Schema::Mage::Protocol",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "protocolparam_unittype_ids",
  "Bio::Chado::Schema::Mage::Protocolparam",
  { "foreign.unittype_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "protocolparam_datatype_ids",
  "Bio::Chado::Schema::Mage::Protocolparam",
  { "foreign.datatype_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "pubs",
  "Bio::Chado::Schema::Pub::Pub",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "pubprops",
  "Bio::Chado::Schema::Pub::Pubprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "pub_relationships",
  "Bio::Chado::Schema::Pub::PubRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "quantificationprops",
  "Bio::Chado::Schema::Mage::Quantificationprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "quantification_relationships",
  "Bio::Chado::Schema::Mage::QuantificationRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "stocks",
  "Bio::Chado::Schema::Stock::Stock",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "stockcollections",
  "Bio::Chado::Schema::Stock::Stockcollection",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "stockcollectionprops",
  "Bio::Chado::Schema::Stock::Stockcollectionprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "stock_cvterms",
  "Bio::Chado::Schema::Stock::StockCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "stockprops",
  "Bio::Chado::Schema::Stock::Stockprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "stock_relationships",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "studydesignprops",
  "Bio::Chado::Schema::Mage::Studydesignprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "studyfactors",
  "Bio::Chado::Schema::Mage::Studyfactor",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "studyprops",
  "Bio::Chado::Schema::Mage::Studyprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "studyprop_features",
  "Bio::Chado::Schema::Mage::StudypropFeature",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "synonyms",
  "Bio::Chado::Schema::Sequence::Synonym",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "treatments",
  "Bio::Chado::Schema::Mage::Treatment",
  { "foreign.type_id" => "self.cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1YBZ9YL/qEXqbWhh6HaW/Q

__PACKAGE__->has_many(
  "featureprops",
  "Chado::Schema::Sequence::Featureprop",
  { "foreign.type_id" => "self.cvterm_id" },
);


# You can replace this text with custom content, and it will be preserved on regeneration
1;
