package Bio::Chado::Schema::Pub::Pubauthor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Pub::Pubauthor

=head1 DESCRIPTION

An author for a publication. Note the denormalisation (hence lack of _ in table name) - this is deliberate as it is in general too hard to assign IDs to authors.

=cut

__PACKAGE__->table("pubauthor");

=head1 ACCESSORS

=head2 pubauthor_id

  data_type: integer
  default_value: nextval('pubauthor_pubauthor_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: integer
  default_value: undef
  is_nullable: 0

Order of author in author list for this pub - order is important.

=head2 editor

  data_type: boolean
  default_value: false
  is_nullable: 1

Indicates whether the author is an editor for linked publication. Note: this is a boolean field but does not follow the normal chado convention for naming booleans.

=head2 surname

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 100

=head2 givennames

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 100

First name, initials

=head2 suffix

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 100

Jr., Sr., etc

=cut

__PACKAGE__->add_columns(
  "pubauthor_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('pubauthor_pubauthor_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "pub_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "rank",
  { data_type => "integer", default_value => undef, is_nullable => 0 },
  "editor",
  { data_type => "boolean", default_value => \"false", is_nullable => 1 },
  "surname",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "givennames",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "suffix",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
);
__PACKAGE__->set_primary_key("pubauthor_id");
__PACKAGE__->add_unique_constraint("pubauthor_c1", ["pub_id", "rank"]);

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BolvyMKXbjVIZxL7VPlcBg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
