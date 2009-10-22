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
  "cell_line_cvterms",
  "Bio::Chado::Schema::CellLine::CellLineCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cell_line_cvtermprops",
  "Bio::Chado::Schema::CellLine::CellLineCvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cell_lineprops",
  "Bio::Chado::Schema::CellLine::CellLineprop",
  { "foreign.type_id" => "self.cvterm_id" },
);
__PACKAGE__->has_many(
  "cell_line_relationships",
  "Bio::Chado::Schema::CellLine::CellLineRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
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


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fC9n/ZcO3hYpoWFiJdCgvA

use Carp;

=head2 add_synonym

 Usage:        $self->add_synonym($synonym , { type => 'exact' , autocreate => 1} );
 Desc:         adds the synonym $new_synonym to this cvterm
               If the synonym $new_synonym already exists, 
               nothing is added.
 Args:         a synonym name  and
    options hashref as:
          {
            synonym_type => [e.g. exact, narrow, broad, related],
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given featureprop name.  Default false.

            cv_name => cv.name to use for the given synonym type.
                       Defaults to 'synonym_type',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms
          }
 Ret:          a Cvtermsynonym object
 Example:

=cut

sub add_synonym {
    my ($self, $synonym, $opts) = @_;
    my $schema = $self->result_source->schema;
    $opts ||= {};
    $opts->{cv_name} = 'synonym_type'
        unless defined $opts->{cv_name};
    $opts->{db_name} = 'null'
        unless defined $opts->{db_name};
    $opts->{dbxref_accession_prefix} = 'autocreated:'
        unless defined $opts->{dbxref_accession_prefix};
    my $data;
    $data->{synonym} = $synonym;
    
    if (defined $opts->{synonym_type} ) { 
	my $synonym_type= $opts->{synonym_type} ; 
	my $synonym_db; #< set as needed below
	my $synonym_cv = do {
	    my $cvrs = $schema->resultset('Cv::Cv');
	    my $find_or_create = $opts->{autocreate} ? 'find_or_create' : 'find';
	    $cvrs->$find_or_create({ name => $opts->{cv_name}},
				   { key => 'cv_c1' })
		or croak "cv '$opts->{cv_name}' not found and autocreate option not passed, cannot continue";
	};
	
	# find/create cvterm and dbxref for the synonym,
	
	my $existing_cvterm =  
            $synonym_cv->find_related('cvterms',
				      { name => $synonym_type,
					is_obsolete => 0,
				      },
				      { key => 'cvterm_c1' },
	    );
	
        # if there is no existing cvterm for this synonym type, and we
        # have the autocreate flag set true, then create a cvterm,
        # dbxref, and db for it if necessary
        unless( $existing_cvterm ) {
            $opts->{autocreate}
	    or croak "cvterm not found for cvterm synonym type  '$synonym_type', and autocreate option not passed, cannot continue";
	    
            # look up the db object if we don't already have it, now
            # that we know we need it
            $synonym_db ||=
                $self->result_source->schema
		->resultset('General::Db')
		->find_or_create( { name => $opts->{db_name} },
				  { key => 'db_c1' }
		);
	    
            # find or create the dbxref for this cvterm we are about
            # to create
            my $dbx_acc = $synonym_type;
            my $dbxref =
                $synonym_db->find_or_create_related('dbxrefs',{ accession => $dbx_acc })
		|| $synonym_db->create_related('dbxrefs',{ accession => $dbx_acc,
							   version => 1,
					       });
	    
            # look up any definition we might have been given for this
            # propname, so we can insert it if given
            my $def = $opts->{definition};
	    
            
	    my $synonym_type_cvterm= $synonym_cv->create_related('cvterms',
								 { name => $synonym_type,
								   is_obsolete => 0,
								   dbxref_id => $dbxref->dbxref_id,
								   $def ? (definition => $def) : (),
								 }
		);
	    $data->{type_id} = $synonym_type_cvterm->cv_id();
        }
    }
    my ($cvtermsynonym)= $self->search_related('featureprops',
					       {type_id => $data->{type_id},
						value   => { 'ilike' , "$synonym" }
					       });
    
    $cvtermsynonym= $self->create_related('cvtermsynonyms' , $data) if !$cvtermsynonym;
    
    return $cvtermsynonym;
}


=head2 delete_synonym

 Usage: $self->delete_synonym($synonym)
 Desc:  delete synonym $synonym from cvterm object
  Ret:  nothing
 Args: $synonym
 Side Effects: Will delete all cvtermsynonyms with synonym=$synonym. Case insensitive 
 Example:

=cut

sub delete_synonym {
    my $self=shift;
    my $synonym=shift;
    
    my $schema = $self->result_source->schema;
    
    $self->result_source->
	schema->
	resultset("Cv::Cvtermsynonym")
	->search( { cvterm_id => $self->get_column('cvterm_id'),
		    synonym   => { 'ilike' , "$synonym" }
		  })
	->delete();
}



=head2 get_secondary_dbxrefs

 Usage: $self->get_secondary_dbxrefs()
 Desc:  find all secondary accessions associated with the cvterm
         These are stored in cvterm_dbxref table as dbxref_ids
 Ret:    a list of accessions (e.g. GO:0000123)
 Args:   none
 Side Effects: none
 Example:

=cut

sub get_secondary_dbxrefs {
    my $self=shift;
    my $schema = $self->result_source->schema;
    my @list;
    my @s =  $self->search_related('cvterm_dbxrefs' , { is_for_definition => 0} );
    foreach (@s) {
	my ($db_name, $accession)  = $schema->resultset("General::Dbxref")->search(
	    { dbxref_id => $_->get_column('dbxref_id') },
	    { join      => { 'db' => 'db_id' },
	      +select   => [ 'db.name', 'dbxref.accession' ],
	    } );
	push @list, $db_name . ":" .  $accession;
    }
    return @list;
}
    

=head2 add_secondary_dbxref

 Usage: $self->add_secondary_dbxref(accession, 1)
 Desc:  add an alternative id to cvterm. Stores in cvterm_dbxref
 Ret:   a CvtermDbxref object
 Args:  an alternative id (i.e. "GO:0001234"). A second arg will store a is_for_definition=1 (default = 0)
 Side Effects: stores a new dbxref if accession is not found in dbxref table
 Example:

=cut

sub add_secondary_dbxref {
    my ($self, $accession, $def)=@_;
    $def = 0 unless $def == 1;
    my $schema = $self->result_source->schema;
    my ($db_name, $acc) = split (/:/, $accession);
    if (!$db_name || $accession) { croak "Did not pass a legal accession! ($accession)" ; }
    my $db = $schema->resultset("General::Db")->find_or_create( 
	{ name => $db_name },
	{ key => 'db_c1' }
	);
    my $dbxref = $db->find_or_create_related('dbxrefs', { accession => $acc } , { key => 'dbxref_c1' }, );
    
    my $cvterm_dbxref = $schema->resultset("Cv::CvtermDbxref")->search(
	{ dbxref_id => $dbxref->get_column('dbxref_id'),
	  cvterm_id => $self->get_column('cvterm_id') }
	)->first();
    if ($cvterm_dbxref) {
	$cvterm_dbxref->update( { is_for_definition => $def } ) if $def;
    }else {
	$cvterm_dbxref = $schema->resultset("Cv::CvtermDbxref")->create(
	    { dbxref_id => $dbxref->get_column('dbxref_id'),
	      cvterm_id => $self->get_column('cvterm_id'),
	      is_for_definition => $def,
	    } );
    }
    return $cvterm_dbxref;
}


=head2 delete_secondary_dbxref
    
 Usage: $self->delete_secondary_dbxref($accession)
 Desc:  delete a cvterm_dbxref from the database 
 Ret:   nothing
 Args:  full accession (db_name:dbxref_accession e.g. PO:0001234)
 Side Effects:
 Example:

=cut
    
sub delete_secondary_dbxref {
    my $self=shift;
    my $accession=shift;
    my $schema = $self->result_source->schema;
    my ($db_name, $acc) = split (/:/, $accession);
    if (!$db_name || $accession) { croak "Did not pass a legal accession! ($accession)" ; }
    
    my ($cvterm_dbxref) = $schema->resultset("General::Db")->search(
	{ name => $db_name } )->
	search_related('dbxrefs' , { accession => $acc } )->
	search_related('cvterm_dbxrefs', { cvterm_id => $self->get_column('cvterm_id') } );
    if ($cvterm_dbxref) { $cvterm_dbxref->delete() ; } 
    
}

1;
