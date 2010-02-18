package Bio::Chado::Schema::Expression::ExpressionCvtermprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Expression::ExpressionCvtermprop

=head1 DESCRIPTION

Extensible properties for
expression to cvterm associations. Examples: qualifiers.

=cut

__PACKAGE__->table("expression_cvtermprop");

=head1 ACCESSORS

=head2 expression_cvtermprop_id

  data_type: integer
  default_value: nextval('expression_cvtermprop_expression_cvtermprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 expression_cvterm_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

The name of the
property/slot is a cvterm. The meaning of the property is defined in
that cvterm. For example, cvterms may come from the FlyBase miscellaneous cv.

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1

The value of the
property, represented as text. Numeric values are converted to their
text representation. This is less efficient than using native database
types, but is easier to query.

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0

Property-Value
ordering. Any expression_cvterm can have multiple values for any particular
property type - these are ordered in a list using rank, counting from
zero. For properties that are single-valued rather than multi-valued,
the default 0 value should be used.

=cut

__PACKAGE__->add_columns(
  "expression_cvtermprop_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('expression_cvtermprop_expression_cvtermprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "expression_cvterm_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "type_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "value",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("expression_cvtermprop_id");
__PACKAGE__->add_unique_constraint(
  "expression_cvtermprop_c1",
  ["expression_cvterm_id", "type_id", "rank"],
);

=head1 RELATIONS

=head2 expression_cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Expression::ExpressionCvterm>

=cut

__PACKAGE__->belongs_to(
  "expression_cvterm",
  "Bio::Chado::Schema::Expression::ExpressionCvterm",
  { expression_cvterm_id => "expression_cvterm_id" },
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
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A5TDmgQwcTjXlB+vp88E4w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
