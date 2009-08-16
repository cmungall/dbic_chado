#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 2;

use Bio::Chado::Schema;
use lib "$FindBin::RealBin/lib";

use DbicChadoTest;

SKIP: {
    my $schema = DbicChadoTest->schema_connect_or_skip(2);
    isa_ok( $schema, 'DBIx::Class::Schema' );

    isa_ok( $schema->resultset('Organism::Organism'), 'DBIx::Class::ResultSet' );

    #my $max_org_id = $schema->resultset('Organism::Organism')->get_column('organism_id')->max;
    #is( $max_org_id, 10, 'correct max_org_id' );
}
