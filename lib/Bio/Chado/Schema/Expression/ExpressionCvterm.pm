package Bio::Chado::Schema::Expression::ExpressionCvterm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("expression_cvterm");
__PACKAGE__->add_columns(
  "expression_cvterm_id",
  {
    data_type => "integer",
    default_value => "nextval('expression_cvterm_expression_cvterm_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "expression_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "cvterm_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
  "cvterm_type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("expression_cvterm_id");
__PACKAGE__->add_unique_constraint(
  "expression_cvterm_c1",
  ["expression_id", "cvterm_id", "cvterm_type_id"],
);
__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
);
__PACKAGE__->belongs_to(
  "cvterm_type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_type_id" },
);
__PACKAGE__->belongs_to(
  "expression",
  "Bio::Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
);
__PACKAGE__->has_many(
  "expression_cvtermprops",
  "Bio::Chado::Schema::Expression::ExpressionCvtermprop",
  { "foreign.expression_cvterm_id" => "self.expression_cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5unWVo2T4LSlWG5vjEJgPQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
