#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 1;

use Chado::Schema;
use lib "$FindBin::RealBin/lib";

use DbicChadoTest;
use DbicChadoTest::TestData;

SKIP: {
    my $schema = DbicChadoTest->schema_connect_or_skip(1);

    DbicChadoTest::TestData->create_test_organisms( $schema );

    my $max_org_id = $schema->resultset('Organism::Organism')->get_column('organism_id')->max;
    is( $max_org_id, 2, 'correct max_org_id' );
}
