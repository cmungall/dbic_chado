#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::RealBin/../lib";

use Test::More tests => 7;
use Test::Exception;
use Bio::Chado::Schema::Test;

my $schema = Bio::Chado::Schema::Test->init_schema();
my $cvterm_rs = $schema->resultset('Cv::Cvterm');
my $stock_rs = $schema->resultset('Stock::Stock');

my $cvterm_name = 'test stock';
my $cv_name = 'test stock';
my $name = 'test stock_name';
my $uniquename = 'unique ' . $name;

$schema->txn_do(sub {
    #create the cvterm for the stock type
    my $cvterm = $cvterm_rs->create_with({ name => $cvterm_name, cv => $cv_name });

    #now create the stock
    my $stock = $stock_rs->create( {
        name => $name,
        uniquename => $uniquename,
        type_id => $cvterm->cvterm_id
                                   } );

    is($stock->name, $name, "stock name test");
    is($stock->uniquename, $uniquename, "stock uniquename test");
    is($stock->type->name, $cvterm_name, "stock type test");

    #create new stockprop
    my $propname = "stockmprop";
    my $value = "value 1";
    my $rank = 3;

    my $href = $stock->create_stockprops({ $propname => $value} , { autocreate => 1, allow_multiple_values => 1 , rank => $rank } );

    my $stockprop = $href->{$propname};
    is($stockprop->value(), $value, "stockmprop value test");
    is($stockprop->rank() , $rank, "stockprop rank test");
    #
    # create stockprop with a value a result of SQL function
    $propname = "date stockmprop";
    $value =  "\\" . "\'now()\'";
    $rank = 1;

    $href = $stock->create_stockprops({ $propname =>  $value} , { autocreate => 1, allow_multiple_values => 1 , rank => $rank } );

    $stockprop = $href->{$propname};
    like($stockprop->value(), qr/^\d+\d$/, "stockmprop value test");
    is($stockprop->rank() , $rank, "stockprop rank test");
});


