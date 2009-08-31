package Bio::Chado::Schema::Pub::Pub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("pub");
__PACKAGE__->add_columns(
  "pub_id",
  {
    data_type => "integer",
    default_value => "nextval('pub_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "title",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "volumetitle",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "volume",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "series_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "issue",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "pyear",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "pages",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "miniref",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_obsolete",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 1,
    size => 1,
  },
  "publisher",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "pubplace",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("pub_id");
__PACKAGE__->add_unique_constraint("pub_c1", ["uniquename"]);
__PACKAGE__->has_many(
  "cell_line_cvterms",
  "Bio::Chado::Schema::CellLine::CellLineCvterm",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "cell_line_features",
  "Bio::Chado::Schema::CellLine::CellLineFeature",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "cell_line_libraries",
  "Bio::Chado::Schema::CellLine::CellLineLibrary",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "cell_lineprop_pubs",
  "Bio::Chado::Schema::CellLine::CellLinepropPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "cell_line_pubs",
  "Bio::Chado::Schema::CellLine::CellLinePub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "cell_line_synonyms",
  "Bio::Chado::Schema::CellLine::CellLineSynonym",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "expression_pubs",
  "Bio::Chado::Schema::Expression::ExpressionPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "feature_cvterms",
  "Bio::Chado::Schema::Sequence::FeatureCvterm",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "feature_cvterm_pubs",
  "Bio::Chado::Schema::Sequence::FeatureCvtermPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "feature_expressions",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "featureloc_pubs",
  "Bio::Chado::Schema::Sequence::FeaturelocPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "featuremap_pubs",
  "Bio::Chado::Schema::Map::FeaturemapPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "featureprop_pubs",
  "Bio::Chado::Schema::Sequence::FeaturepropPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "feature_pubs",
  "Bio::Chado::Schema::Sequence::FeaturePub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "feature_relationshipprop_pubs",
  "Bio::Chado::Schema::Sequence::FeatureRelationshippropPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "feature_relationship_pubs",
  "Bio::Chado::Schema::Sequence::FeatureRelationshipPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "feature_synonyms",
  "Bio::Chado::Schema::Sequence::FeatureSynonym",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "library_cvterms",
  "Bio::Chado::Schema::Library::LibraryCvterm",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "libraryprop_pubs",
  "Bio::Chado::Schema::Library::LibrarypropPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "library_pubs",
  "Bio::Chado::Schema::Library::LibraryPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "library_synonyms",
  "Bio::Chado::Schema::Library::LibrarySynonym",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Genetic::Phendesc",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparisons",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_cvterms",
  "Bio::Chado::Schema::Genetic::PhenotypeComparisonCvterm",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "phylonode_pubs",
  "Bio::Chado::Schema::Phylogeny::PhylonodePub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "phylotree_pubs",
  "Bio::Chado::Schema::Phylogeny::PhylotreePub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "protocols",
  "Bio::Chado::Schema::Mage::Protocol",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->has_many(
  "pubauthors",
  "Bio::Chado::Schema::Pub::Pubauthor",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pub_dbxrefs",
  "Bio::Chado::Schema::Pub::PubDbxref",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pubprops",
  "Bio::Chado::Schema::Pub::Pubprop",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pub_relationship_object_ids",
  "Bio::Chado::Schema::Pub::PubRelationship",
  { "foreign.object_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pub_relationship_subject_ids",
  "Bio::Chado::Schema::Pub::PubRelationship",
  { "foreign.subject_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "stock_cvterms",
  "Bio::Chado::Schema::Stock::StockCvterm",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "stockprop_pubs",
  "Bio::Chado::Schema::Stock::StockpropPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "stock_pubs",
  "Bio::Chado::Schema::Stock::StockPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "stock_relationship_pubs",
  "Bio::Chado::Schema::Stock::StockRelationshipPub",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "studies",
  "Bio::Chado::Schema::Mage::Study",
  { "foreign.pub_id" => "self.pub_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AURomhLcMFXffNohJLSLlQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
