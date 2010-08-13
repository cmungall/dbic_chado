#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::RealBin/../lib";

use Test::More;
use BCSTest;

# shorthand for writing left and right indices
sub lr($$) {  left_idx => shift, right_idx => shift }

my $schema = BCSTest->init_schema();
my $phylonodes = $schema->resultset('Phylogeny::Phylonode');

$schema->txn_do(sub {
    my $phylotree =
        $schema->resultset('Phylogeny::Phylotree')
               ->create({
                   dbxref => {
                       db => { name => 'null' },
                       accession => 'FakeTree'
                      },
                   name => 'FakeTree',
               });

    my $root = $phylonodes->create({
        phylotree => $phylotree,
        lr 1 20,
    });

    my $level2 = $root->add_to_phylonodes({ lr 2 19 });

    my (undef,$second_child) = $phylonodes->populate([
        map +{ phylotree => $phylotree, parent_phylonode => $root,
               left_idx => $_->[0], right_idx => $_->[1]
             },
        [

       ]);

});


done_testing;

