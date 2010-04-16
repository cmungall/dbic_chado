package #  hide from PAUSE
    DbicChadoTest;
use strict;
use warnings;

use Test::More;

use Bio::Chado::Schema;

sub schema_connect {
    my ($class,%args) = @_;
    my $test_dsn = $ENV{BCS_TEST_DSN};

    unless($test_dsn) {
        diag "please supply BCS_TEST_DSN environment var to connect to the schema";
        return;
    }

    return Bio::Chado::Schema->connect( $test_dsn );
}

sub schema_connect_or_skip {
    shift->schema_connect
        or skip "please supply BCS_TEST_DSN environment variable to connect to the schema", shift;
}

1;

