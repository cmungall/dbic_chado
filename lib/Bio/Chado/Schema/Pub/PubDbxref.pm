package Bio::Chado::Schema::Pub::PubDbxref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Pub::PubDbxref

=head1 DESCRIPTION

Handle links to repositories,
e.g. Pubmed, Biosis, zoorec, OCLC, Medline, ISSN, coden...

=cut

__PACKAGE__->table("pub_dbxref");

=head1 ACCESSORS

=head2 pub_dbxref_id

  data_type: integer
  default_value: nextval('pub_dbxref_pub_dbxref_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 is_current

  data_type: boolean
  default_value: true
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "pub_dbxref_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('pub_dbxref_pub_dbxref_id_seq'::regclass)",
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
  "dbxref_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "is_current",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("pub_dbxref_id");
__PACKAGE__->add_unique_constraint("pub_dbxref_c1", ["pub_id", "dbxref_id"]);

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

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CZmY+f/o/WS2TX0nirYPog


# You can replace this text with custom content, and it will be preserved on regeneration
1;
