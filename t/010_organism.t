#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 3;
use Test::Exception;

use Bio::Chado::Schema;
use lib "$FindBin::RealBin/lib";
use BCSTest;

my $schema = BCSTest->init_schema();
isa_ok( $schema, 'DBIx::Class::Schema' );

isa_ok( $schema->resultset('Organism::Organism'), 'DBIx::Class::ResultSet' );


lives_ok(
    sub {
        $schema->resultset('Organism::Organism')
                                ->create({
                                    organism_id => 1,
                                    genus       => 'Robus',
                                    species     => 'buelsii',
                                });
        $schema->organism_id();
    },
    'query into organism table lives'
);
