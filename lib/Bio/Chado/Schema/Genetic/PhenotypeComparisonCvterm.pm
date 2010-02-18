package Bio::Chado::Schema::Genetic::PhenotypeComparisonCvterm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Genetic::PhenotypeComparisonCvterm

=cut

__PACKAGE__->table("phenotype_comparison_cvterm");

=head1 ACCESSORS

=head2 phenotype_comparison_cvterm_id

  data_type: integer
  default_value: nextval('phenotype_comparison_cvterm_phenotype_comparison_cvterm_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 phenotype_comparison_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 cvterm_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "phenotype_comparison_cvterm_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('phenotype_comparison_cvterm_phenotype_comparison_cvterm_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "phenotype_comparison_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "cvterm_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "pub_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("phenotype_comparison_cvterm_id");
__PACKAGE__->add_unique_constraint(
  "phenotype_comparison_cvterm_c1",
  ["phenotype_comparison_id", "cvterm_id"],
);

=head1 RELATIONS

=head2 phenotype_comparison

Type: belongs_to

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->belongs_to(
  "phenotype_comparison",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "phenotype_comparison_id" => "phenotype_comparison_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

=head2 cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AYKqInPdPvrLrkw6iQoEpA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
