package Bio::Chado::Schema::Library::LibraryDbxref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Library::LibraryDbxref

=cut

__PACKAGE__->table("library_dbxref");

=head1 ACCESSORS

=head2 library_dbxref_id

  data_type: integer
  default_value: nextval('library_dbxref_library_dbxref_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 library_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 is_current

  data_type: boolean
  default_value: true
  is_nullable: 0
  size: 1

=cut

__PACKAGE__->add_columns(
  "library_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('library_dbxref_library_dbxref_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "library_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_current",
  {
    data_type => "boolean",
    default_value => "true",
    is_nullable => 0,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("library_dbxref_id");
__PACKAGE__->add_unique_constraint("library_dbxref_c1", ["library_id", "dbxref_id"]);

=head1 RELATIONS

=head2 library

Type: belongs_to

Related object: L<Bio::Chado::Schema::Library::Library>

=cut

__PACKAGE__->belongs_to(
  "library",
  "Bio::Chado::Schema::Library::Library",
  { library_id => "library_id" },
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


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s3G82kW9KYg8XP+6oWui6w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
