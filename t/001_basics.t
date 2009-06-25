#!/usr/bin/perl
use strict;
use warnings;
use English;

use Test::More tests => 2;

BEGIN {
  use_ok(  'Chado::Schema'  )
    or BAIL_OUT('could not include the module being tested');
}

SKIP: {

    my $test_dsn = $ENV{DBIC_CHADO_TEST_DSN}
        or skip 'no DBIC_CHADO_TEST_DSN environment variable provided', 1;

    my $s = Chado::Schema->connect( $test_dsn );
    isa_ok( $s, 'Chado::Schema' );


}
