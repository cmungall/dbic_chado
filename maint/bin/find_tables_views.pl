#!/usr/bin/perl
use strict;
use File::Find;
use Data::Dumper;

use Fatal qw/ open /;

my %schema;
find( sub {
          return unless /\.sql$/i;
          extract_tables_views(\%schema,$File::Find::name);
      },
      $ARGV[0]
    );

print Dumper \%schema;


sub extract_tables_views {
    my ($schema,$file) = @_;
    local $/=";";
    open my $f, '<', $file;
    while(<$f>) {
        $schema->{lc $1}->{$2}=1 if /create\s+(table|view)\s+(\S+)/i;
    }
}


