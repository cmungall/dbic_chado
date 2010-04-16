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

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'magedocumentation_magedocumentation_id_seq'

=head2 mageml_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 tableinfo_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  is_nullable: 0

=head2 mageidentifier

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "magedocumentation_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "magedocumentation_magedocumentation_id_seq",
  },
  "mageml_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "tableinfo_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "row_id",
  { data_type => "integer", is_nullable => 0 },
  "mageidentifier",
  { data_type => "text", is_nullable => 0 },
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
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 mageml

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Mageml>

=cut

__PACKAGE__->belongs_to(
  "mageml",
  "Bio::Chado::Schema::Mage::Mageml",
  { mageml_id => "mageml_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zA4DknysZqtZtbcXxbEybg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
