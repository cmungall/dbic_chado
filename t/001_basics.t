#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 1;
use lib "$FindBin::RealBin/lib";
use DbicChadoTest;
use BCSTest;

my $schema = BCSTest->init_schema();
isa_ok( $schema, 'DBIx::Class::Schema' );
