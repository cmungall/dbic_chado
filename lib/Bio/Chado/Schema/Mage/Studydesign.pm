package Bio::Chado::Schema::Mage::Studydesign;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Studydesign

=cut

__PACKAGE__->table("studydesign");

=head1 ACCESSORS

=head2 studydesign_id

  data_type: integer
  default_value: nextval('studydesign_studydesign_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 study_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 description

  data_type: text
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "studydesign_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('studydesign_studydesign_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "study_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "description",
  { data_type => "text", default_value => undef, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("studydesign_id");

=head1 RELATIONS

=head2 study

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Study>

=cut

__PACKAGE__->belongs_to(
  "study",
  "Bio::Chado::Schema::Mage::Study",
  { study_id => "study_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 studydesignprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Studydesignprop>

=cut

__PACKAGE__->has_many(
  "studydesignprops",
  "Bio::Chado::Schema::Mage::Studydesignprop",
  { "foreign.studydesign_id" => "self.studydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 studyfactors

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Studyfactor>

=cut

__PACKAGE__->has_many(
  "studyfactors",
  "Bio::Chado::Schema::Mage::Studyfactor",
  { "foreign.studydesign_id" => "self.studydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dqOVepJxOzlRSaRXwKF5Bw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
