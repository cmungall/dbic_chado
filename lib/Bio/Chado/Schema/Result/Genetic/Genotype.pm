package Bio::Chado::Schema::Result::Genetic::Genotype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Result::Genetic::Genotype

=head1 DESCRIPTION

Genetic context. A genotype is defined by a collection of features, mutations, balancers, deficiencies, haplotype blocks, or engineered constructs.

=cut

__PACKAGE__->table("genotype");

=head1 ACCESSORS

=head2 genotype_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'genotype_genotype_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 1

Optional alternative name for a genotype,
for display purposes.

=head2 uniquename

  data_type: 'text'
  is_nullable: 0

The unique name for a genotype;
typically derived from the features making up the genotype.

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "genotype_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "genotype_genotype_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "uniquename",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("genotype_id");
__PACKAGE__->add_unique_constraint("genotype_c1", ["uniquename"]);

=head1 RELATIONS

=head2 feature_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::FeatureGenotype>

=cut

__PACKAGE__->has_many(
  "feature_genotypes",
  "Bio::Chado::Schema::Result::Genetic::FeatureGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 genotypeprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::Genotypeprop>

=cut

__PACKAGE__->has_many(
  "genotypeprops",
  "Bio::Chado::Schema::Result::Genetic::Genotypeprop",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentGenotype>

=cut

__PACKAGE__->has_many(
  "nd_experiment_genotypes",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phendescs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::Phendesc>

=cut

__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Result::Genetic::Phendesc",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenotype_comparison_genotype1s

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->has_many(
  "phenotype_comparison_genotype1s",
  "Bio::Chado::Schema::Result::Genetic::PhenotypeComparison",
  { "foreign.genotype1_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenotype_comparison_genotype2s

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->has_many(
  "phenotype_comparison_genotype2s",
  "Bio::Chado::Schema::Result::Genetic::PhenotypeComparison",
  { "foreign.genotype2_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenstatements

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::Phenstatement>

=cut

__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Result::Genetic::Phenstatement",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockGenotype>

=cut

__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Result::Stock::StockGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-09-22 08:45:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pl/UQ6kAn7WVHaoTZUrPWg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
