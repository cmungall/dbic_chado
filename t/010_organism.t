#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 1;

use Chado::Schema;
use lib "$FindBin::RealBin/lib";

use DbicChadoTest;

SKIP: {
    my $schema = DbicChadoTest->schema_connect_or_skip(1);
    isa_ok( $schema, 'DBIx::Class::Schema' );

    #my $max_org_id = $schema->resultset('Organism::Organism')->get_column('organism_id')->max;
    #is( $max_org_id, 10, 'correct max_org_id' );
}
