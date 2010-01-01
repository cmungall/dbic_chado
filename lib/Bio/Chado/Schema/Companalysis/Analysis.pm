package Bio::Chado::Schema::Companalysis::Analysis;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Companalysis::Analysis - An analysis is a particular type of a
    computational analysis; it may be a blast of one sequence against
    another, or an all by all blast, or a different kind of analysis
    altogether. It is a single unit of computation.

=cut

__PACKAGE__->table("analysis");

=head1 ACCESSORS

=head2 analysis_id

  data_type: integer
  default_value: nextval('analysis_analysis_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

A way of grouping analyses. This
    should be a handy short identifier that can help people find an
    analysis they want. For instance "tRNAscan", "cDNA", "FlyPep",
    "SwissProt", and it should not be assumed to be unique. For instance, there may be lots of separate analyses done against a cDNA database.

=head2 description

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 program

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

Program name, e.g. blastx, blastp, sim4, genscan.

=head2 programversion

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

Version description, e.g. TBLASTX 2.0MP-WashU [09-Nov-2000].

=head2 algorithm

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

Algorithm name, e.g. blast.

=head2 sourcename

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

Source name, e.g. cDNA, SwissProt.

=head2 sourceversion

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 sourceuri

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

This is an optional, permanent URL or URI for the source of the  analysis. The idea is that someone could recreate the analysis directly by going to this URI and fetching the source data (e.g. the blast database, or the training model).

=head2 timeexecuted

  data_type: timestamp without time zone
  default_value: now()
  is_nullable: 0
  size: 8

=cut

__PACKAGE__->add_columns(
  "analysis_id",
  {
    data_type => "integer",
    default_value => "nextval('analysis_analysis_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "program",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "programversion",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "algorithm",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "sourcename",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "sourceversion",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "sourceuri",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "timeexecuted",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("analysis_id");
__PACKAGE__->add_unique_constraint("analysis_c1", ["program", "programversion", "sourcename"]);

=head1 RELATIONS

=head2 analysisfeatures

Type: has_many

Related object: L<Bio::Chado::Schema::Companalysis::Analysisfeature>

=cut

__PACKAGE__->has_many(
  "analysisfeatures",
  "Bio::Chado::Schema::Companalysis::Analysisfeature",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 analysisprops

Type: has_many

Related object: L<Bio::Chado::Schema::Companalysis::Analysisprop>

=cut

__PACKAGE__->has_many(
  "analysisprops",
  "Bio::Chado::Schema::Companalysis::Analysisprop",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylotrees

Type: has_many

Related object: L<Bio::Chado::Schema::Phylogeny::Phylotree>

=cut

__PACKAGE__->has_many(
  "phylotrees",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 quantifications

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Quantification>

=cut

__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Mage::Quantification",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lXb3FwdGKv9O8HopmQELyw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
