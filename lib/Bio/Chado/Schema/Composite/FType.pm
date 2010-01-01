package Bio::Chado::Schema::Composite::FType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FType

=cut

__PACKAGE__->table("f_type");

=head1 ACCESSORS

=head2 feature_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 type

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 1024

=head2 residues

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 seqlen

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 md5checksum

  data_type: character
  default_value: undef
  is_nullable: 1
  size: 32

=head2 type_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 timeaccessioned

  data_type: timestamp without time zone
  default_value: undef
  is_nullable: 1
  size: 8

=head2 timelastmodified

  data_type: timestamp without time zone
  default_value: undef
  is_nullable: 1
  size: 8

=cut

__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "type",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 1024,
  },
  "residues",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "seqlen",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "md5checksum",
  {
    data_type => "character",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "timeaccessioned",
  {
    data_type => "timestamp without time zone",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
  "timelastmodified",
  {
    data_type => "timestamp without time zone",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k1tfycL1L0Woq69LwUe5Tw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
