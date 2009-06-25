#!/usr/bin/perl
use strict;
use warnings;
use English;

use Test::More tests => 1;

BEGIN {
  use_ok(  'Chado::Schema'  )
    or BAIL_OUT('could not include the module being tested');
}

