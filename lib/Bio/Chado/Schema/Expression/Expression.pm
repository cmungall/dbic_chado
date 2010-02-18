package Bio::Chado::Schema::Expression::Expression;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Expression::Expression - The expression table is essentially a bridge table.

=cut

__PACKAGE__->table("expression");

=head1 ACCESSORS

=head2 expression_id

  data_type: integer
  default_value: nextval('expression_expression_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 uniquename

  data_type: text
  default_value: undef
  is_nullable: 0

=head2 md5checksum

  data_type: character
  default_value: undef
  is_nullable: 1
  size: 32

=head2 description

  data_type: text
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "expression_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('expression_expression_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "uniquename",
  { data_type => "text", default_value => undef, is_nullable => 0 },
  "md5checksum",
  {
    data_type => "character",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "description",
  { data_type => "text", default_value => undef, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("expression_id");
__PACKAGE__->add_unique_constraint("expression_c1", ["uniquename"]);

=head1 RELATIONS

=head2 expression_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionCvterm>

=cut

__PACKAGE__->has_many(
  "expression_cvterms",
  "Bio::Chado::Schema::Expression::ExpressionCvterm",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 expression_images

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionImage>

=cut

__PACKAGE__->has_many(
  "expression_images",
  "Bio::Chado::Schema::Expression::ExpressionImage",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 expressionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::Expressionprop>

=cut

__PACKAGE__->has_many(
  "expressionprops",
  "Bio::Chado::Schema::Expression::Expressionprop",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 expression_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionPub>

=cut

__PACKAGE__->has_many(
  "expression_pubs",
  "Bio::Chado::Schema::Expression::ExpressionPub",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_expressions

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::FeatureExpression>

=cut

__PACKAGE__->has_many(
  "feature_expressions",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k3oYZHDg7VCwOj9atY4VPQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
