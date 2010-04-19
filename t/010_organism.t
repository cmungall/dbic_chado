#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::RealBin/lib";
use Test::More tests => 3;
use Test::Exception;
use BCSTest;

my $schema = BCSTest->init_schema();

isa_ok( $schema, 'DBIx::Class::Schema' );

isa_ok( $schema->resultset('Organism::Organism'), 'DBIx::Class::ResultSet' );

lives_ok(
    sub {
        $schema->resultset('Organism::Organism')
            ->get_column('organism_id')
            ->max()
    },
    'query into organism table lives'
);
