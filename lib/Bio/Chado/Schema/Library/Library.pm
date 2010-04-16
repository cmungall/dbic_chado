package Bio::Chado::Schema::Library::Library;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Library::Library

=cut

__PACKAGE__->table("library");

=head1 ACCESSORS

=head2 library_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'library_library_id_seq'

=head2 organism_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'character varying'
  is_nullable: 1
  size: 255

=head2 uniquename

  data_type: 'text'
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The type_id foreign key links
to a controlled vocabulary of library types. Examples of this would be: "cDNA_library" or "genomic_library"

=head2 is_obsolete

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 timeaccessioned

  data_type: 'timestamp without time zone'
  default_value: CURRENT_TIMESTAMP
  is_nullable: 0

=head2 timelastmodified

  data_type: 'timestamp without time zone'
  default_value: CURRENT_TIMESTAMP
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "library_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "library_library_id_seq",
  },
  "organism_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "character varying", is_nullable => 1, size => 255 },
  "uniquename",
  { data_type => "text", is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "is_obsolete",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "timeaccessioned",
  {
    data_type     => "timestamp without time zone",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable   => 0,
  },
  "timelastmodified",
  {
    data_type     => "timestamp without time zone",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable   => 0,
  },
);
__PACKAGE__->set_primary_key("library_id");
__PACKAGE__->add_unique_constraint("library_c1", ["organism_id", "uniquename", "type_id"]);

=head1 RELATIONS

=head2 cell_line_libraries

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineLibrary>

=cut

__PACKAGE__->has_many(
  "cell_line_libraries",
  "Bio::Chado::Schema::CellLine::CellLineLibrary",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 organism

Type: belongs_to

Related object: L<Bio::Chado::Schema::Organism::Organism>

=cut

__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 library_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibraryCvterm>

=cut

__PACKAGE__->has_many(
  "library_cvterms",
  "Bio::Chado::Schema::Library::LibraryCvterm",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibraryDbxref>

=cut

__PACKAGE__->has_many(
  "library_dbxrefs",
  "Bio::Chado::Schema::Library::LibraryDbxref",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_features

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibraryFeature>

=cut

__PACKAGE__->has_many(
  "library_features",
  "Bio::Chado::Schema::Library::LibraryFeature",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 libraryprops

Type: has_many

Related object: L<Bio::Chado::Schema::Library::Libraryprop>

=cut

__PACKAGE__->has_many(
  "libraryprops",
  "Bio::Chado::Schema::Library::Libraryprop",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibraryPub>

=cut

__PACKAGE__->has_many(
  "library_pubs",
  "Bio::Chado::Schema::Library::LibraryPub",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibrarySynonym>

=cut

__PACKAGE__->has_many(
  "library_synonyms",
  "Bio::Chado::Schema::Library::LibrarySynonym",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 15:58:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ivJpndXKs+5lbgBu7MSLew


# You can replace this text with custom content, and it will be preserved on regeneration
1;
