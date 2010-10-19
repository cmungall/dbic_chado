#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::RealBin/../lib";

use Test::More tests => 16;
use Test::Exception;
use BCSTest;


my $schema = BCSTest->init_schema();
my $cvterm_rs = $schema->resultset('Cv::Cvterm');

my $name = 'test cvterm_name';
my $cvname = 'test cv_name';

$schema->txn_do(sub {
    my $cvterm = $cvterm_rs->create_with({ name => $name, cv => $cvname });

    is( $cvterm->name, $name, 'cvterm_name test' );
    is( $cvterm->cv->name, $cvname, 'cv_name test');
    is( $cvterm->dbxref->accession, 'autocreated:' . $name, 'dbxref autocreated accession test' );
    is( $cvterm->dbxref->db->name, 'null', 'db name autocreated test' );

    #now add a synonym
    my $synonym='test synonym';
    my $type='exact';
    my $cvtermsynonym= $cvterm->add_synonym($synonym, { synonym_type=>$type, autocreate=>1 });

    is($cvtermsynonym->synonym, $synonym, "synonym test");
    is($cvtermsynonym->cvterm->name, $name, "synonym type test");
    is($cvtermsynonym->type->cv->name, 'synonym_type', "synonym cv name test");
    is($cvtermsynonym->type->dbxref->accession, $type, "synonym dbxref accession test");

    #try to store the same synonym - should pass since new synonyms are created after passing
    ##search_related with type_id and case-insensitive value

    my $existing_s = $cvterm->add_synonym($synonym, { synonym_type=>$type, autocreate=>1 });

    is($cvtermsynonym->cvtermsynonym_id() , $existing_s->cvtermsynonym_id(), "Existing synonym test");
    ##delete the synonym
    $cvterm->delete_synonym($synonym);

    is($cvterm->search_related('cvtermsynonyms', {synonym=>$synonym } )->count , 0, "deleted synonym test");

    #add a secondary dbxref
    my $sec_db = 'SEC';
    my $sec_acc= '1234';
    $cvterm->add_secondary_dbxref($sec_db.":".$sec_acc);

    my ($cvterm_dbxref)= $cvterm->get_secondary_dbxrefs;
    my ($re_db, $re_acc) = split(  ":" , $cvterm_dbxref);
    is($re_db, $sec_db, "secondary dbxref db name test");
    is($re_acc, $sec_acc, "secondary dbxref accession test");

    #and delete the secondary dbxref
    $cvterm->delete_secondary_dbxref($sec_db.":".$sec_acc);

    ($cvterm_dbxref)= $cvterm->get_secondary_dbxrefs;
    is($cvterm_dbxref, undef, "deleted secondary dbxref test");
    is($cvterm->search_related('cvterm_dbxrefs' )->count , 0, "deleted cvterm_dbxref test");

    #create new cvtermprop
    my $propname= "cvtermprop";
    my $value="value 1";
    my $rank=3;


    my $href= $cvterm->create_cvtermprops({ $propname => $value} , { autocreate => 1, allow_multiple_values => 1 , rank => $rank } );

    my $cvtermprop = $href->{$propname};
    is($cvtermprop->value(), $value, "cvtermprop value test");
    is($cvtermprop->rank() , $rank, "cvtermprop rank test");
    #
    $schema->txn_rollback;
});
