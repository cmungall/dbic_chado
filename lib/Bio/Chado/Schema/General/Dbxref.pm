package Bio::Chado::Schema::General::Dbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("dbxref");
__PACKAGE__->add_columns(
  "dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('dbxref_dbxref_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "db_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "accession",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "version",
  {
    data_type => "character varying",
    default_value => "''::character varying",
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("dbxref_id");
__PACKAGE__->add_unique_constraint("dbxref_c1", ["db_id", "accession", "version"]);
__PACKAGE__->has_many(
  "arraydesigns",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "biomaterials",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "biomaterial_dbxrefs",
  "Bio::Chado::Schema::Mage::BiomaterialDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->might_have(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "cvterm_dbxrefs",
  "Bio::Chado::Schema::Cv::CvtermDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->belongs_to("db", "Bio::Chado::Schema::General::Db", { db_id => "db_id" });
__PACKAGE__->has_many(
  "dbxrefprops",
  "Bio::Chado::Schema::Cv::Dbxrefprop",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "features",
  "Bio::Chado::Schema::Sequence::Feature",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "feature_cvterm_dbxrefs",
  "Bio::Chado::Schema::Sequence::FeatureCvtermDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "feature_dbxrefs",
  "Bio::Chado::Schema::Sequence::FeatureDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "library_dbxrefs",
  "Bio::Chado::Schema::Library::LibraryDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "organism_dbxrefs",
  "Bio::Chado::Schema::Organism::OrganismDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "phylonode_dbxrefs",
  "Bio::Chado::Schema::Phylogeny::PhylonodeDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "phylotrees",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "protocols",
  "Bio::Chado::Schema::Mage::Protocol",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "pub_dbxrefs",
  "Bio::Chado::Schema::Pub::PubDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "stocks",
  "Bio::Chado::Schema::Stock::Stock",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "stock_dbxrefs",
  "Bio::Chado::Schema::Stock::StockDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);
__PACKAGE__->has_many(
  "studies",
  "Bio::Chado::Schema::Mage::Study",
  { "foreign.dbxref_id" => "self.dbxref_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rR3tWj4uo3BpimMYuw/xwg

# add an explicit sequence name to the dbxref
__PACKAGE__->add_columns(
  'dbxref_id',
   { %{ __PACKAGE__->column_info('dbxref_id') },
     sequence => 'dbxref_dbxref_id_seq',
   }
  );

# You can replace this text with custom content, and it will be preserved on regeneration
1;
