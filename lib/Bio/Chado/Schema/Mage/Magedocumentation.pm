package Bio::Chado::Schema::Mage::Magedocumentation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Magedocumentation

=cut

__PACKAGE__->table("magedocumentation");

=head1 ACCESSORS

=head2 magedocumentation_id

  data_type: integer
  default_value: nextval('magedocumentation_magedocumentation_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 mageml_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 tableinfo_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 row_id

  data_type: integer
  default_value: undef
  is_nullable: 0

=head2 mageidentifier

  data_type: text
  default_value: undef
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "magedocumentation_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('magedocumentation_magedocumentation_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "mageml_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "tableinfo_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "row_id",
  { data_type => "integer", default_value => undef, is_nullable => 0 },
  "mageidentifier",
  { data_type => "text", default_value => undef, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("magedocumentation_id");

=head1 RELATIONS

=head2 tableinfo

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Tableinfo>

=cut

__PACKAGE__->belongs_to(
  "tableinfo",
  "Bio::Chado::Schema::General::Tableinfo",
  { tableinfo_id => "tableinfo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 mageml

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Mageml>

=cut

__PACKAGE__->belongs_to(
  "mageml",
  "Bio::Chado::Schema::Mage::Mageml",
  { mageml_id => "mageml_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:W1HoQ+6T2EaFGahlnPRqAQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
