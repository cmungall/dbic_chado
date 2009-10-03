package Bio::Chado::Schema::Organism::Organism;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("organism");
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
__PACKAGE__->has_many(
  "biomaterials",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { "foreign.taxon_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "cell_lines",
  "Bio::Chado::Schema::CellLine::CellLine",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "features",
  "Bio::Chado::Schema::Sequence::Feature",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "libraries",
  "Bio::Chado::Schema::Library::Library",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "organism_dbxrefs",
  "Bio::Chado::Schema::Organism::OrganismDbxref",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "organismprops",
  "Bio::Chado::Schema::Organism::Organismprop",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparisons",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "phylonode_organisms",
  "Bio::Chado::Schema::Phylogeny::PhylonodeOrganism",
  { "foreign.organism_id" => "self.organism_id" },
);
__PACKAGE__->has_many(
  "stocks",
  "Bio::Chado::Schema::Stock::Stock",
  { "foreign.organism_id" => "self.organism_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Vzu6QXQLHamgvblpf9m7xQ

use Carp;

=head2 create_organismprops

  Usage: $set->create_organismprops($my_prop, { baz => 2, foo => 'bar' });
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
          }
  Ret  : hashref of { propname => new organismprop object }

=cut

sub create_organismprops {
    my ($self, $props, $opts) = @_;

    # normalize the props to hashrefs
    foreach (values %$props) {
        $_ = { value => $_ } unless ref eq 'HASH';
    }

    # process opts
    $opts ||= {};
    $opts->{cv_name} = 'organism_property'
        unless defined $opts->{cv_name};
    $opts->{db_name} = 'null'
        unless defined $opts->{db_name};
    $opts->{dbxref_accession_prefix} = 'autocreated:'
        unless defined $opts->{dbxref_accession_prefix};

    my $schema = $self->result_source->schema;

    my $organism_prop_cv = do {
        my $cvrs = $schema->resultset('Cv::Cv');
        my $find_or_create = $opts->{autocreate} ? 'find_or_create' : 'find';
        $cvrs->$find_or_create({ name => $opts->{cv_name}},
                               { key => 'cv_c1' })
            or croak "cv '$opts->{cv_name}' not found and autocreate option not passed, cannot continue";
    };

    my $organism_prop_db; #< set as needed below

    # find/create cvterms and dbxrefs for each of our organismprops,
    # and remember them in %propterms
    my %propterms;
    foreach my $propname (keys %$props) {
        my $existing_cvterm = $propterms{$propname} =
            $organism_prop_cv->find_related('cvterms',
                                           { name => $propname,
                                             is_obsolete => 0,
                                           },
                                           { key => 'cvterm_c1' },
                                          );

        # if there is no existing cvterm for this organismprop, and we
        # have the autocreate flag set true, then create a cvterm,
        # dbxref, and db for it if necessary
        unless( $existing_cvterm ) {
            $opts->{autocreate}
               or croak "cvterm not found for organism property '$propname', and autocreate option not passed, cannot continue";

            # look up the db object if we don't already have it, now
            # that we know we need it
            $organism_prop_db ||=
                $self->result_source->schema
                     ->resultset('General::Db')
                     ->find_or_create( { name => $opts->{db_name} },
                                       { key => 'db_c1' }
                                     );

            # find or create the dbxref for this cvterm we are about
            # to create
            my $dbx_acc = $opts->{dbxref_accession_prefix}.$propname;
            my $dbxref =
                $organism_prop_db->find_or_create_related('dbxrefs',{ accession => $dbx_acc })
             || $organism_prop_db->create_related('dbxrefs',{ accession => $dbx_acc,
                                                             version => 1,
                                                           });

            # look up any definition we might have been given for this
            # propname, so we can insert it if given
            my $def = $opts->{definitions}->{$propname};

            $propterms{$propname} =
                $organism_prop_cv->create_related('cvterms',
                                                 { name => $propname,
                                                   is_obsolete => 0,
                                                   dbxref_id => $dbxref->dbxref_id,
                                                   $def ? (definition => $def) : (),
                                                 }
                                                );
        }
    }
    
    my %props;
    while( my ($propname,$propval) = each %$props ) {
	
        my $data = ref $propval
            ? {%$propval}
            : { value => $propval };
	
        $data->{type_id} = $propterms{$propname}->cvterm_id;
	
	my $rank=0;
	#find existing props for this type
	my $max_rank= $self->search_related('organismprops',
					    { type_id =>$data->{type_id},
					    })->get_column('rank')->max();
	
	$rank = $max_rank+1 if $max_rank;
        $data->{rank} = $rank;
	
	#check if the value is stored
	my ($organismprop)= $self->search_related('organismprops',
						  {type_id => $data->{type_id},
						   value   => $data->{value},
						  });
	
        if (!$organismprop) {
	    $props{$propname} = $self->create_related('organismprops',
						      $data
		);
	}
    }
    return \%props;
}


1;
