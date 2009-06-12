#!/usr/bin/perl

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;
use warnings;

use English;
use Carp;
use FindBin;

use Getopt::Long;
use Pod::Usage;

#use Data::Dumper;


## parse and validate command-line options
GetOptions(
          )
    or pod2usage(1);

## check out a new chado schema copy


# parse the modules definition
# drop all tables from the target database
# traverse modules in dependency order
#   list the current set of tables and views
#   load the module into the database
#   find what tables and views are new
#   do a make_schema_at, restricted to the new set of tables and views,
#       dumping to Chado::Schema::ModuleName::ViewOrTableName


__END__

=head1 NAME

update_dbic_dump.pl - script to sync the DBIx::Class object layer with
the current set of chado tables

=head1 DESCRIPTION

This script basically:

  - check out a clean chado schema copy
  - drop all tables from the target database
  - make and install it with all modules
  - do a make_schema_at on it to refresh modules

=head1 SYNOPSIS

  update_dbic_dump.pl [options] chado_version

  Options:

    none yet

=head1 MAINTAINER

Robert Buels

=head1 AUTHOR

Robert Buels, E<lt>rmb32@cornell.eduE<gt>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Boyce Thompson Institute for Plant Research

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
