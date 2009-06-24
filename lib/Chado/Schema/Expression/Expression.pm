package Chado::Schema::Expression::Expression;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("expression");
__PACKAGE__->add_columns(
  "expression_id",
  {
    data_type => "integer",
    default_value => "nextval('expression_expression_id_seq'::regclass)",
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
  "md5checksum",
  {
    data_type => "character",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("expression_id");
__PACKAGE__->add_unique_constraint("expression_c1", ["uniquename"]);
__PACKAGE__->has_many(
  "expression_cvterms",
  "Chado::Schema::Expression::ExpressionCvterm",
  { "foreign.expression_id" => "self.expression_id" },
);
__PACKAGE__->has_many(
  "expression_images",
  "Chado::Schema::Expression::ExpressionImage",
  { "foreign.expression_id" => "self.expression_id" },
);
__PACKAGE__->has_many(
  "expressionprops",
  "Chado::Schema::Expression::Expressionprop",
  { "foreign.expression_id" => "self.expression_id" },
);
__PACKAGE__->has_many(
  "expression_pubs",
  "Chado::Schema::Expression::ExpressionPub",
  { "foreign.expression_id" => "self.expression_id" },
);
__PACKAGE__->has_many(
  "feature_expressions",
  "Chado::Schema::Expression::FeatureExpression",
  { "foreign.expression_id" => "self.expression_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uyEQ1jHNz+13ntfne/5PpQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
