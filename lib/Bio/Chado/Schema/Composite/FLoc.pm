package Bio::Chado::Schema::Composite::FLoc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FLoc

=cut

__PACKAGE__->table("f_loc");

=head1 ACCESSORS

=head2 feature_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 nbeg

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 nend

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 strand

  data_type: smallint
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "nbeg",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "nend",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "strand",
  { data_type => "smallint", default_value => undef, is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:21:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:986ieWaN0oQpdtwLQelzig


# You can replace this text with custom content, and it will be preserved on regeneration
1;
