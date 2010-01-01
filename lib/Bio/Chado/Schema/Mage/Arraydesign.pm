package Bio::Chado::Schema::Mage::Arraydesign;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Arraydesign - General properties about an array.
An array is a template used to generate physical slides, etc.  It
contains layout information, as well as global array properties, such
as material (glass, nylon) and spot dimensions (in rows/columns).

=cut

__PACKAGE__->table("arraydesign");

=head1 ACCESSORS

=head2 arraydesign_id

  data_type: integer
  default_value: nextval('arraydesign_arraydesign_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 manufacturer_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 platformtype_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 substratetype_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

=head2 protocol_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

=head2 name

  data_type: text
  default_value: undef
  is_nullable: 0
  size: undef

=head2 version

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 description

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 array_dimensions

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 element_dimensions

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 num_of_elements

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 num_array_columns

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 num_array_rows

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 num_grid_columns

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 num_grid_rows

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 num_sub_columns

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 num_sub_rows

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "arraydesign_id",
  {
    data_type => "integer",
    default_value => "nextval('arraydesign_arraydesign_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "manufacturer_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "platformtype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "substratetype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "protocol_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "version",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "array_dimensions",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "element_dimensions",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "num_of_elements",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_array_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_array_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_grid_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_grid_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_sub_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num_sub_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("arraydesign_id");
__PACKAGE__->add_unique_constraint("arraydesign_c1", ["name"]);

=head1 RELATIONS

=head2 manufacturer

Type: belongs_to

Related object: L<Bio::Chado::Schema::Contact::Contact>

=cut

__PACKAGE__->belongs_to(
  "manufacturer",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "manufacturer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 platformtype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "platformtype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "platformtype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 substratetype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "substratetype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "substratetype_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 protocol

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Protocol>

=cut

__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 arraydesignprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Arraydesignprop>

=cut

__PACKAGE__->has_many(
  "arraydesignprops",
  "Bio::Chado::Schema::Mage::Arraydesignprop",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 assays

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Assay>

=cut

__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 elements

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Element>

=cut

__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sG3XR8oTPQ4+jIAOHwSMYg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
