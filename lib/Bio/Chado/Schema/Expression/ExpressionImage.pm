package Bio::Chado::Schema::Expression::ExpressionImage;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("expression_image");
__PACKAGE__->add_columns(
  "expression_image_id",
  {
    data_type => "integer",
    default_value => "nextval('expression_image_expression_image_id_seq'::regclass)",
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
  "eimage_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("expression_image_id");
__PACKAGE__->add_unique_constraint("expression_image_c1", ["expression_id", "eimage_id"]);
__PACKAGE__->belongs_to(
  "eimage",
  "Bio::Chado::Schema::Expression::Eimage",
  { eimage_id => "eimage_id" },
);
__PACKAGE__->belongs_to(
  "expression",
  "Bio::Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:083rOnJVUGkjXW+mjvlX0A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
