package DbicChadoTest;
use strict;
use warnings;

use Test::More;

sub schema_connect {
    my ($class,%args) = @_;
    my $test_dsn = $ENV{DBIC_CHADO_TEST_DSN};

    unless($test_dsn) {
        diag "please supply DBIC_CHADO_TEST_DSN environment var to connect to the schema";
        return;
    }

    return Chado::Schema->connect( $test_dsn );
}

sub schema_connect_or_skip {
    shift->schema_connect
        or skip "please supply DBIC_CHADO_TEST_DSN environment var to connect to the schema", shift;
}

1;

