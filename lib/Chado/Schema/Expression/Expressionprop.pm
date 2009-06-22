package Chado::Schema::Expression::Expressionprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("expressionprop");
__PACKAGE__->add_columns(
  "expressionprop_id",
  {
    data_type => "integer",
    default_value => "nextval('expressionprop_expressionprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "expression_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("expressionprop_id");
__PACKAGE__->add_unique_constraint("expressionprop_pkey", ["expressionprop_id"]);
__PACKAGE__->add_unique_constraint("expressionprop_c1", ["expression_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "expression_id",
  "Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DFJHVsUAXUd+DeUrG4qzWA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
