#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 4;
use Test::Exception;


use lib "$FindBin::RealBin/../lib";

use DbicChadoTest;
use Bio::Chado::Schema;

SKIP: {
    my $schema = DbicChadoTest->schema_connect_or_skip(4);
    my $cvterm_rs = $schema->resultset('Cv::Cvterm');

    my $name = 'test cvterm_name';
    my $cvname = 'test cv_name';

    $schema->txn_do(sub {
	my $cvterm = $cvterm_rs->create_with({ name => $name, cv => $cvname });

        is( $cvterm->name, $name, 'cvterm_name test' );
        is( $cvterm->cv->name,
	    $cvname,
	    'cv_name test');
        is( $cvterm->dbxref->accession,
	    'autocreated:' . $name,
	    'dbxref autocreated accession test' );
        is( $cvterm->dbxref->db->name,
	    'null',
	    'db name autocreated test' );
	$schema->txn_rollback;
    });
}
