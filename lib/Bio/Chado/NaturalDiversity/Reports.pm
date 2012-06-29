package Bio::Chado::NaturalDiversity::Reports;

=head1 NAME

    Bio::Chado::NaturalDiversity::Reports

=head1 SYNOPSIS

 use Bio::Chado::NaturalDiversity::Reports

    my $sreport = Bio::Chado::NaturalDiversity::Reports->new;
 my $data = $sreport->phenotypes_by_trait($phenotypes);

=head1 DESCRIPTION

 A collection of functions for formatting Chado stock related data in different data structures
 which can be useful for passing to different programs and software.
 Because the Chado stock table is the key for storing samples subjected to genotyping and
 phenotyping experiments, it interacts with several other Chado modules, such as
 NaturalDiversity for storing the experiment data,
 Project for storing the metadata about the experiments,
 Phenotype for the phenotyping values
 Genotype for the genotyping values.

 This module generates several reports for easier access to such data.

 Note that all data reports heavily rely on the Natural Diversity schema.
 The results in each report may differ based on how the experiment data is stored in the databse. There is no one correct way of loading phenotyping and genotyping data in this module,
  However there are some examples for 'best practice' in the GMOD Wiki (http://gmod.org/wiki/Chado_Natural_Diversity_Module)



=head1 AUTHOR

Naama Menda <nm249@cornell.edu>


=head1 COPYRIGHT AND LICENCE

Copyright 2012 Boyce Thompson Institute for Plant Research

Copyright 2012 Sol Genomics Network (solgenomics.net)

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut

use Modern::Perl;
use Bio::Chado::Schema;



=head2 new

 Usage: my $nd_report = Bio::Chado::NaturalDiversity::Reports->new()
 Desc:
 Ret:
 Args:
 Side Effects:
 Example:

=cut


sub new {
    my $class = shift;
    my $self = bless( {} , $class);

    return $self;
}


=head2 phenotypes_by_trait

  Usage: $self->phenotypes_by_trait($phenotype_rs , { %args } )
    Desc:  generate a report of phenotype values by trait name/accession
    Ret:   arrayref of tab delimited data
    Args:  a listref of L<Bio::Chado::Schema::Result::Phenotype::Phenotype> ResultSets
        [optional] list of args to filter the report. Currently supported args are

 Side Effects: none
    Example:

=cut

sub phenotypes_by_trait {
    my $self = shift;
    my $phenotypes = shift;
    #my %args = shift;
    #############
    ##
    my $phen_hashref; #hashref of hashes for the phenotype data
    ##
    my %cvterms ; #hash for unique cvterms
    my $replicate = 1;
    my $cvterm_name;
    foreach my $rs (@$phenotypes) {
        while ( my $r =  $rs->next )  {
            my $observable = $r->get_column('observable');
            next if !$observable;
            if ($cvterm_name eq $observable) { $replicate ++ ; } else { $replicate = 1 ; }
            $cvterm_name = $observable;
            my $accession = $r->get_column('accession');
            my $db_name = $r->get_column('db_name');
            my $project = $r->get_column('project_description') ;

            my $hash_key = $project . "|" . $replicate;
            $phen_hashref->{$hash_key}{accession} = $db_name . ":" . $accession ;
            $phen_hashref->{$hash_key}{$observable} = $r->get_column('value');
            $phen_hashref->{$hash_key}{stock_id} = $r->get_column('stock_id');
            $cvterms{$observable} =  $db_name . ":" . $accession ;
        }
    }
    my @data;
    my $d = "uniquename\tstock_id\t";
    foreach my $term_name (sort { $cvterms{$a} cmp $cvterms{$b} } keys %cvterms )  {# sort ontology terms
        my $ontology_id = $cvterms{$term_name};
        $d .=   $ontology_id . "|" . $term_name . "\t" ;
    }
    foreach my $key ( sort keys %$phen_hashref ) {
        #print the unique key (row header)
        # print some more columns with metadata
        # print the value by cvterm name
        $d .=  "\n" . $key . "\t"  . $phen_hashref->{$key}{stock_id} .  "\t"  ;
        foreach my $term_name ( sort { $cvterms{$a} cmp $cvterms{$b} } keys %cvterms ) {
            $d .=  $phen_hashref->{$key}{$term_name} . "\t" ;
        }
    }
    return $d;
}


###
1;#
###
