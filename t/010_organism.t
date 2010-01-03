#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 3;
use Test::Exception;

use Bio::Chado::Schema;
use lib "$FindBin::RealBin/lib";

use DbicChadoTest;

SKIP: {
    my $schema = DbicChadoTest->schema_connect_or_skip(3);
    isa_ok( $schema, 'DBIx::Class::Schema' );

    isa_ok( $schema->resultset('Organism::Organism'), 'DBIx::Class::ResultSet' );

    lives_ok {
	my $max_org_id = $schema->resultset('Organism::Organism')->get_column('organism_id')->max;
    } 'query into organism table lives';
}
