#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 3;
use Test::Exception;

use Bio::Chado::Schema;
use lib "$FindBin::RealBin/../lib";

use DbicChadoTest;

SKIP: {
    my $schema = DbicChadoTest->schema_connect_or_skip(2);
    isa_ok( $schema, 'DBIx::Class::Schema' );

    my $sf = $schema->resultset('Sequence::Feature');
    isa_ok( $sf, 'DBIx::Class::ResultSet' );

    # try a joined query through one of the longer has_many rels
    lives_ok {
	my $children = $sf->search_related('feature_relationship_object_ids')->count;
    } 'join through a long has_many name does not die';
}
