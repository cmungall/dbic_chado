package Chado::Schema::Expression::ExpressionImage;

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
    is_nullable => 0,
    size => 4,
  },
  "expression_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "eimage_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("expression_image_id");
__PACKAGE__->add_unique_constraint("expression_image_c1", ["expression_id", "eimage_id"]);
__PACKAGE__->add_unique_constraint("expression_image_pkey", ["expression_image_id"]);
__PACKAGE__->belongs_to(
  "eimage_id",
  "Chado::Schema::Expression::Eimage",
  { eimage_id => "eimage_id" },
);
__PACKAGE__->belongs_to(
  "expression_id",
  "Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uyE+IXKrf+BHUcEDikrogw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
