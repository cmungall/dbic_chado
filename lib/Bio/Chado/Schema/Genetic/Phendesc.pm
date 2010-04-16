package Bio::Chado::Schema::Genetic::Phendesc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Genetic::Phendesc

=head1 DESCRIPTION

A summary of a _set_ of phenotypic statements for any one gcontext made in any one publication.

=cut

__PACKAGE__->table("phendesc");

=head1 ACCESSORS

=head2 phendesc_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'phendesc_phendesc_id_seq'

=head2 genotype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 environment_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "phendesc_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "phendesc_phendesc_id_seq",
  },
  "genotype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "environment_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("phendesc_id");
__PACKAGE__->add_unique_constraint(
  "phendesc_c1",
  ["genotype_id", "environment_id", "type_id", "pub_id"],
);

=head1 RELATIONS

=head2 environment

Type: belongs_to

Related object: L<Bio::Chado::Schema::Genetic::Environment>

=cut

__PACKAGE__->belongs_to(
  "environment",
  "Bio::Chado::Schema::Genetic::Environment",
  { environment_id => "environment_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 genotype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Genetic::Genotype>

=cut

__PACKAGE__->belongs_to(
  "genotype",
  "Bio::Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WiXet1KYngRH+TaTQ+zmuA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
