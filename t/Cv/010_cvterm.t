#!/usr/bin/perl
use strict;
use warnings;
use FindBin;

use Test::More tests => 6;
use Test::Exception;


use lib "$FindBin::RealBin/../lib";

#use DbicChadoTest;
use CXGN::DB::Connection;
use Bio::Chado::Schema;


#my $schema = DbicChadoTest->schema_connect_or_skip(3);

my $schema=  Bio::Chado::Schema->connect( sub{ CXGN::DB::Connection->new()->get_actual_dbh()} ,  { on_connect_do => ['SET search_path TO public;'], }
    );
my $dbh= $schema->storage()->dbh();

isa_ok( $schema, 'DBIx::Class::Schema' );


my $last_cv_id= $schema->resultset('Cv::Cv')->get_column('cv_id')->max;
my $last_cvterm_id= $schema->resultset('Cv::Cvterm')->get_column('cvterm_id')->max;
my $last_db_id= $schema->resultset('General::Db')->get_column('db_id')->max;
my $last_dbxref_id= $schema->resultset('General::Dbxref')->get_column('dbxref_id')->max;

eval {
    my $cvterm_res = $schema->resultset('Cv::Cvterm');
    isa_ok( $cvterm_res, 'DBIx::Class::ResultSet' );

    #
    my $name = 'test cvterm_name';
    my $cvname = 'test cv_name';
    my $cvterm = $cvterm_res->new({})->find_or_create_cvterm($name, { cv_name => $cvname });

    is($cvterm->name(), $name , 'cvterm_name test');
    is( ($cvterm)->find_related('cv', { key => 'cv_id' } )->get_column('name'), $cvname , 'cv_name test');
    is($cvterm->find_related('dbxref', { key =>'dbxref_id' } )->accession(), 'autocreated:' . $name , 'dbxref autocreated accession test');
    is($cvterm->find_related('dbxref', {key=> 'dbxref_id' } )->find_related('db', { key => 'db_id' } )->name(), 'null' , 'db name autocreated test');

};

if ($@) {
    print STDERR "An error occurred: $@\n";
}

# rollback in any case
$dbh->rollback();

#reset table sequence
$dbh->do("SELECT setval ('cv_cv_id_seq', $last_cv_id, true)");
$dbh->do("SELECT setval ('cvterm_cvterm_id_seq', $last_cvterm_id, true)");
$dbh->do("SELECT setval ('db_db_id_seq', $last_db_id, true)");
$dbh->do("SELECT setval ('dbxref_dbxref_id_seq', $last_dbxref_id, true)");



