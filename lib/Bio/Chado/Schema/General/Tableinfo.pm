package Bio::Chado::Schema::General::Tableinfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::General::Tableinfo

=cut

__PACKAGE__->table("tableinfo");

=head1 ACCESSORS

=head2 tableinfo_id

  data_type: integer
  default_value: nextval('tableinfo_tableinfo_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 30

=head2 primary_key_column

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 30

=head2 is_view

  data_type: integer
  default_value: 0
  is_nullable: 0

=head2 view_on_table_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 superclass_table_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 is_updateable

  data_type: integer
  default_value: 1
  is_nullable: 0

=head2 modification_date

  data_type: date
  default_value: now()
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tableinfo_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('tableinfo_tableinfo_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 30,
  },
  "primary_key_column",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "is_view",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "view_on_table_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "superclass_table_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "is_updateable",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "modification_date",
  { data_type => "date", default_value => \"now()", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("tableinfo_id");
__PACKAGE__->add_unique_constraint("tableinfo_c1", ["name"]);

=head1 RELATIONS

=head2 controls

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Control>

=cut

__PACKAGE__->has_many(
  "controls",
  "Bio::Chado::Schema::Mage::Control",
  { "foreign.tableinfo_id" => "self.tableinfo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 magedocumentations

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Magedocumentation>

=cut

__PACKAGE__->has_many(
  "magedocumentations",
  "Bio::Chado::Schema::Mage::Magedocumentation",
  { "foreign.tableinfo_id" => "self.tableinfo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J7rUmSjvQnDDcwdr/VzYUQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
