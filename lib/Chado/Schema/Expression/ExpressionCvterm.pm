package Chado::Schema::Expression::ExpressionCvterm;

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
    is_nullable => 0,
    size => 4,
  },
  "expression_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
  "cvterm_type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("expression_cvterm_id");
__PACKAGE__->add_unique_constraint(
  "expression_cvterm_c1",
  ["expression_id", "cvterm_id", "cvterm_type_id"],
);
__PACKAGE__->add_unique_constraint("expression_cvterm_pkey", ["expression_cvterm_id"]);
__PACKAGE__->belongs_to(
  "expression_id",
  "Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
);
__PACKAGE__->has_many(
  "expression_cvtermprops",
  "Chado::Schema::Expression::ExpressionCvtermprop",
  { "foreign.expression_cvterm_id" => "self.expression_cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RO9OWCFmCDF9xtCIpslAOg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
