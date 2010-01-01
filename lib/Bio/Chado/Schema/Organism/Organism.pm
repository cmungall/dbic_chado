package Bio::Chado::Schema::Organism::Organism;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Organism::Organism - The organismal taxonomic
classification. Note that phylogenies are represented using the
phylogeny module, and taxonomies can be represented using the cvterm
module or the phylogeny module.

=cut

__PACKAGE__->table("organism");

=head1 ACCESSORS

=head2 organism_id

  data_type: integer
  default_value: nextval('organism_organism_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 abbreviation

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 genus

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

=head2 species

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

A type of organism is always
uniquely identified by genus and species. When mapping from the NCBI
taxonomy names.dmp file, this column must be used where it
is present, as the common_name column is not always unique (e.g. environmental
samples). If a particular strain or subspecies is to be represented,
this is appended onto the species name. Follows standard NCBI taxonomy
pattern.

=head2 common_name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 comment

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=cut

__PACKAGE__->add_columns(
  "organism_id",
  {
    data_type => "integer",
    default_value => "nextval('organism_organism_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "abbreviation",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "genus",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "species",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "common_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "comment",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("organism_id");
__PACKAGE__->add_unique_constraint("organism_c1", ["genus", "species"]);

=head1 RELATIONS

=head2 biomaterials

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Biomaterial>

=cut

__PACKAGE__->has_many(
  "biomaterials",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { "foreign.taxon_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_lines

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLine>

=cut

__PACKAGE__->has_many(
  "cell_lines",
  "Bio::Chado::Schema::CellLine::CellLine",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 features

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=cut

__PACKAGE__->has_many(
  "features",
  "Bio::Chado::Schema::Sequence::Feature",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 libraries

Type: has_many

Related object: L<Bio::Chado::Schema::Library::Library>

=cut

__PACKAGE__->has_many(
  "libraries",
  "Bio::Chado::Schema::Library::Library",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 organism_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Organism::OrganismDbxref>

=cut

__PACKAGE__->has_many(
  "organism_dbxrefs",
  "Bio::Chado::Schema::Organism::OrganismDbxref",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 organismprops

Type: has_many

Related object: L<Bio::Chado::Schema::Organism::Organismprop>

=cut

__PACKAGE__->has_many(
  "organismprops",
  "Bio::Chado::Schema::Organism::Organismprop",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenotype_comparisons

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->has_many(
  "phenotype_comparisons",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonode_organisms

Type: has_many

Related object: L<Bio::Chado::Schema::Phylogeny::PhylonodeOrganism>

=cut

__PACKAGE__->has_many(
  "phylonode_organisms",
  "Bio::Chado::Schema::Phylogeny::PhylonodeOrganism",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::Stock>

=cut

__PACKAGE__->has_many(
  "stocks",
  "Bio::Chado::Schema::Stock::Stock",
  { "foreign.organism_id" => "self.organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jzKnEWsUHUzLFlaFpKO1mg

use Carp;

=head2 create_organismprops

  Usage: $set->create_organismprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create organism properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given featureprop name.  Default false.

            cv_name => cv.name to use for the given organismprops.
                       Defaults to 'organism_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

            allow_duplicate_values => default false.
               If true, allow duplicate instances of the same cvterm
               and value in the properties of the feature.  Duplicate
               values will have different ranks.
          }
  Ret  : hashref of { propname => new organismprop object }

=cut

sub create_organismprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts ||= {};
    $opts->{cv_name} = 'organism_property'
        unless defined $opts->{cv_name};

    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'organismprops',
        );
}


1;
