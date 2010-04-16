package Bio::Chado::Schema::Expression::ExpressionCvterm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Expression::ExpressionCvterm

=cut

__PACKAGE__->table("expression_cvterm");

=head1 ACCESSORS

=head2 expression_cvterm_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'expression_cvterm_expression_cvterm_id_seq'

=head2 expression_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 cvterm_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 cvterm_type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "expression_cvterm_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "expression_cvterm_expression_cvterm_id_seq",
  },
  "expression_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "cvterm_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "cvterm_type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("expression_cvterm_id");
__PACKAGE__->add_unique_constraint(
  "expression_cvterm_c1",
  ["expression_id", "cvterm_id", "cvterm_type_id"],
);

=head1 RELATIONS

=head2 cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 cvterm_type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "cvterm_type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 expression

Type: belongs_to

Related object: L<Bio::Chado::Schema::Expression::Expression>

=cut

__PACKAGE__->belongs_to(
  "expression",
  "Bio::Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 expression_cvtermprops

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionCvtermprop>

=cut

__PACKAGE__->has_many(
  "expression_cvtermprops",
  "Bio::Chado::Schema::Expression::ExpressionCvtermprop",
  { "foreign.expression_cvterm_id" => "self.expression_cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zMt7NS7Vu4E8IBmNT7bqaQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
