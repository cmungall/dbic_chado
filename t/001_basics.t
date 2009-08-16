#!/usr/bin/perl
use strict;
use warnings;
use English;
use FindBin;

use Test::More tests => 2;
use lib "$FindBin::RealBin/lib";
use DbicChadoTest;

BEGIN {
  use_ok(  'Bio::Chado::Schema'  )
    or BAIL_OUT('could not include the module being tested');
}

SKIP: {
    my $s = DbicChadoTest->schema_connect_or_skip(1);
    isa_ok( $s, 'Bio::Chado::Schema' );

}
