package Bio::Chado::Schema;

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_classes;


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:G1fnTOuqELdY0CYrwKEDsA


# You can replace this text with custom content, and it will be preserved on regeneration
1;


__END__

=head1 NAME

Bio::Chado::Schema - standard DBIx::Class layer for the Chado database schema

=head1 SYNOPSIS

  use Bio::Chado::Schema;

  my $chado = Bio::Chado::Schema->connect($dsn,$user,$password);

  print "number of rows in feature table: ",
        $chado->resultset('Sequence::Feature')->count,
        "\n";


=head1 DESCRIPTION

This is a standard object-relational mapping layer for use with the
GMOD Chado database schema.  This layer is implemented with
L<DBIx::Class>, generated with the help of the very fine
L<DBIx::Class::Schema::Loader> module.

To learn how to use this DBIx::Class ORM layer, a good starting
point is the L<DBIx::Class::Manual>.

=head1 CONTRIBUTORS

Robert Buels, <rmb32@cornell.edu>

=head1 AUTHOR

Robert Buels, <rmb32@cornell.edu>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Boyce Thompson Institute for Plant Research

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

