package Bio::Chado::Schema::Sequence::Synonym;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::Synonym

=head1 DESCRIPTION

A synonym for a feature. One feature can have multiple synonyms, and the same synonym can apply to multiple features.

=cut

__PACKAGE__->table("synonym");

=head1 ACCESSORS

=head2 synonym_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'synonym_synonym_id_seq'

=head2 name

  data_type: 'character varying'
  is_nullable: 0
  size: 255

The synonym itself. Should be human-readable machine-searchable ascii text.

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

Types would be symbol and fullname for now.

=head2 synonym_sgml

  data_type: 'character varying'
  is_nullable: 0
  size: 255

The fully specified synonym, with any non-ascii characters encoded in SGML.

=cut

__PACKAGE__->add_columns(
  "synonym_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "synonym_synonym_id_seq",
  },
  "name",
  { data_type => "character varying", is_nullable => 0, size => 255 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "synonym_sgml",
  { data_type => "character varying", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("synonym_id");
__PACKAGE__->add_unique_constraint("synonym_c1", ["name", "type_id"]);

=head1 RELATIONS

=head2 cell_line_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineSynonym>

=cut

__PACKAGE__->has_many(
  "cell_line_synonyms",
  "Bio::Chado::Schema::CellLine::CellLineSynonym",
  { "foreign.synonym_id" => "self.synonym_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureSynonym>

=cut

__PACKAGE__->has_many(
  "feature_synonyms",
  "Bio::Chado::Schema::Sequence::FeatureSynonym",
  { "foreign.synonym_id" => "self.synonym_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibrarySynonym>

=cut

__PACKAGE__->has_many(
  "library_synonyms",
  "Bio::Chado::Schema::Library::LibrarySynonym",
  { "foreign.synonym_id" => "self.synonym_id" },
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


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pF/PaUC144/og1HJvOKw2w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
