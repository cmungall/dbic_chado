package Bio::Chado::Schema::Expression::Eimage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Expression::Eimage

=cut

__PACKAGE__->table("eimage");

=head1 ACCESSORS

=head2 eimage_id

  data_type: integer
  default_value: nextval('eimage_eimage_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 eimage_data

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

We expect images in eimage_data (e.g. JPEGs) to be uuencoded.

=head2 eimage_type

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

Describes the type of data in eimage_data.

=head2 image_uri

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "eimage_id",
  {
    data_type => "integer",
    default_value => "nextval('eimage_eimage_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "eimage_data",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "eimage_type",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "image_uri",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("eimage_id");

=head1 RELATIONS

=head2 expression_images

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionImage>

=cut

__PACKAGE__->has_many(
  "expression_images",
  "Bio::Chado::Schema::Expression::ExpressionImage",
  { "foreign.eimage_id" => "self.eimage_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LW57FA7HmWPIVYu+OUJu1A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
