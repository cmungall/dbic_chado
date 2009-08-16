package Bio::Chado::Schema::Expression::ExpressionPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("expression_pub");
__PACKAGE__->add_columns(
  "expression_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('expression_pub_expression_pub_id_seq'::regclass)",
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
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("expression_pub_id");
__PACKAGE__->add_unique_constraint("expression_pub_c1", ["expression_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "expression",
  "Bio::Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kd5TQgDPVuw9fl19w+jFbg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
