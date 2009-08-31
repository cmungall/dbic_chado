package Bio::Chado::Schema::Expression::FeatureExpressionprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_expressionprop");
__PACKAGE__->add_columns(
  "feature_expressionprop_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_expressionprop_feature_expressionprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_expression_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
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
__PACKAGE__->set_primary_key("feature_expressionprop_id");
__PACKAGE__->add_unique_constraint(
  "feature_expressionprop_c1",
  ["feature_expression_id", "type_id", "rank"],
);
__PACKAGE__->belongs_to(
  "feature_expression",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "feature_expression_id" => "feature_expression_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:txR5uNXPmp92TWa802zT9g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
