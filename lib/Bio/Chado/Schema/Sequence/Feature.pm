package Bio::Chado::Schema::Sequence::Feature;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature");
__PACKAGE__->add_columns(
  "feature_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_feature_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
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
  "organism_id",
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
  "residues",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "seqlen",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "md5checksum",
  {
    data_type => "character",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_analysis",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "is_obsolete",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "timeaccessioned",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
  "timelastmodified",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("feature_id");
__PACKAGE__->add_unique_constraint("feature_c1", ["organism_id", "uniquename", "type_id"]);
__PACKAGE__->has_many(
  "analysisfeatures",
  "Bio::Chado::Schema::Companalysis::Analysisfeature",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
);
__PACKAGE__->has_many(
  "feature_cvterms",
  "Bio::Chado::Schema::Sequence::FeatureCvterm",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_dbxrefs",
  "Bio::Chado::Schema::Sequence::FeatureDbxref",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_expressions",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_genotype_feature_ids",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_genotype_chromosome_ids",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.chromosome_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featureloc_feature_ids",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featureloc_srcfeature_ids",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { "foreign.srcfeature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_phenotypes",
  "Bio::Chado::Schema::Phenotype::FeaturePhenotype",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurepos_feature_ids",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurepos_map_feature_ids",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.map_feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featureprops",
  "Bio::Chado::Schema::Sequence::Featureprop",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_pubs",
  "Bio::Chado::Schema::Sequence::FeaturePub",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_leftendf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.leftendf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_rightstartf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.rightstartf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_rightendf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.rightendf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_leftstartf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.leftstartf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_feature_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_relationship_subject_ids",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "foreign.subject_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_relationship_object_ids",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "foreign.object_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_synonyms",
  "Bio::Chado::Schema::Sequence::FeatureSynonym",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "library_features",
  "Bio::Chado::Schema::Library::LibraryFeature",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "studyprop_features",
  "Bio::Chado::Schema::Mage::StudypropFeature",
  { "foreign.feature_id" => "self.feature_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vUlrYA81srV51UtYIO1ukw

__PACKAGE__->belongs_to(
  'organism',
  'Chado::Schema::Organism::Organism',
  { 'foreign.organism_id' => 'self.organism_id' },
);

__PACKAGE__->belongs_to
    ( 'primary_dbxref',
      'Chado::Schema::General::Dbxref',
      { 'foreign.dbxref_id' => 'self.dbxref_id' },
    );

__PACKAGE__->many_to_many
    (
     'secondary_dbxrefs',
     'feature_dbxrefs' => 'dbxref',
    );


=head2 create_featureprops

  Usage: $set->create_featureprops('cv_name', { baz => 2, foo => 'bar' });
  Desc : convenience method to create feature properties using cvterms
          from the ontology with the given name
  Args : CV name, hashref of { propname => value, ...}
  Ret  : hashref of { propname => new featureprop object }

=cut

sub create_featureprops {
    my ($self, $cv_name, $props) = @_;

    foreach (values %$props) {
        $_ = { value => $_ } unless ref;
    }

    my %propterms;
    my $feature_prop_cv = $self->result_source->schema
                               ->resultset('Cv::Cv')
                               ->find_or_create({ name => $cv_name},{key => 'cv_c1'});

    # find/create cvterms for each of our featureprops
    foreach my $propname (keys %$props) {
        $propterms{$propname} = $feature_prop_cv->find_or_create_related('cvterms',
                                                                         { name => $propname,
                                                                           is_obsolete => 0,
                                                                         },
                                                                         { key => 'cvterm_c1' },
                                                                        );
    }
    my %props;
    while( my ($propname,$propval) = each %$props ) {

        my $data = ref $propval
            ? {%$propval}
            : { value => $propval };

        $data->{type_id} = $propterms{$propname}->cvterm_id;

        $props{$propname} = $self->create_related('featureprops',
                                                  $data
                                                 );
    }

    return \%props;
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
