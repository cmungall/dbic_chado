package Bio::Chado::Schema::Phenotype::Phenotype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Phenotype::Phenotype - A phenotypic statement, or a single
atomic phenotypic observation, is a controlled sentence describing
observable effects of non-wild type function. E.g. Obs=eye, attribute=color, cvalue=red.

=cut

__PACKAGE__->table("phenotype");

=head1 ACCESSORS

=head2 phenotype_id

  data_type: integer
  default_value: nextval('phenotype_phenotype_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 uniquename

  data_type: text
  default_value: undef
  is_nullable: 0
  size: undef

=head2 observable_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

The entity: e.g. anatomy_part, biological_process.

=head2 attr_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

Phenotypic attribute (quality, property, attribute, character) - drawn from PATO.

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

Value of attribute - unconstrained free text. Used only if cvalue_id is not appropriate.

=head2 cvalue_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

Phenotype attribute value (state).

=head2 assay_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

Evidence type.

=cut

__PACKAGE__->add_columns(
  "phenotype_id",
  {
    data_type => "integer",
    default_value => "nextval('phenotype_phenotype_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "observable_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "attr_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "cvalue_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "assay_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("phenotype_id");
__PACKAGE__->add_unique_constraint("phenotype_c1", ["uniquename"]);

=head1 RELATIONS

=head2 feature_phenotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Phenotype::FeaturePhenotype>

=cut

__PACKAGE__->has_many(
  "feature_phenotypes",
  "Bio::Chado::Schema::Phenotype::FeaturePhenotype",
  { "foreign.phenotype_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 assay

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "assay_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 attr

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "attr",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "attr_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 observable

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "observable",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "observable_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 cvalue

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "cvalue",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvalue_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 phenotype_comparison_phenotype1_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->has_many(
  "phenotype_comparison_phenotype1_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.phenotype1_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenotype_comparison_phenotype2_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->has_many(
  "phenotype_comparison_phenotype2_ids",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.phenotype2_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenotype_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Phenotype::PhenotypeCvterm>

=cut

__PACKAGE__->has_many(
  "phenotype_cvterms",
  "Bio::Chado::Schema::Phenotype::PhenotypeCvterm",
  { "foreign.phenotype_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenstatements

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::Phenstatement>

=cut

__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.phenotype_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bECmSk/o+GQILL3diG5tMg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
