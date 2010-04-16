package Bio::Chado::Schema::CellLine::CellLine;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::CellLine::CellLine

=cut

__PACKAGE__->table("cell_line");

=head1 ACCESSORS

=head2 cell_line_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cell_line_cell_line_id_seq'

=head2 name

  data_type: 'character varying'
  is_nullable: 1
  size: 255

=head2 uniquename

  data_type: 'character varying'
  is_nullable: 0
  size: 255

=head2 organism_id

  data_type: 'integer'
  is_foreign_key: 1
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
  "cell_line_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cell_line_cell_line_id_seq",
  },
  "name",
  { data_type => "character varying", is_nullable => 1, size => 255 },
  "uniquename",
  { data_type => "character varying", is_nullable => 0, size => 255 },
  "organism_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
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
__PACKAGE__->set_primary_key("cell_line_id");
__PACKAGE__->add_unique_constraint("cell_line_c1", ["uniquename", "organism_id"]);

=head1 RELATIONS

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

=head2 cell_line_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineCvterm>

=cut

__PACKAGE__->has_many(
  "cell_line_cvterms",
  "Bio::Chado::Schema::CellLine::CellLineCvterm",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineDbxref>

=cut

__PACKAGE__->has_many(
  "cell_line_dbxrefs",
  "Bio::Chado::Schema::CellLine::CellLineDbxref",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_features

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineFeature>

=cut

__PACKAGE__->has_many(
  "cell_line_features",
  "Bio::Chado::Schema::CellLine::CellLineFeature",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_libraries

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineLibrary>

=cut

__PACKAGE__->has_many(
  "cell_line_libraries",
  "Bio::Chado::Schema::CellLine::CellLineLibrary",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_lineprops

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineprop>

=cut

__PACKAGE__->has_many(
  "cell_lineprops",
  "Bio::Chado::Schema::CellLine::CellLineprop",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLinePub>

=cut

__PACKAGE__->has_many(
  "cell_line_pubs",
  "Bio::Chado::Schema::CellLine::CellLinePub",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineRelationship>

=cut

__PACKAGE__->has_many(
  "cell_line_relationship_subjects",
  "Bio::Chado::Schema::CellLine::CellLineRelationship",
  { "foreign.subject_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineRelationship>

=cut

__PACKAGE__->has_many(
  "cell_line_relationship_objects",
  "Bio::Chado::Schema::CellLine::CellLineRelationship",
  { "foreign.object_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineSynonym>

=cut

__PACKAGE__->has_many(
  "cell_line_synonyms",
  "Bio::Chado::Schema::CellLine::CellLineSynonym",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 15:58:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3xgnNF+d0OGkEcqxurUQPQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
