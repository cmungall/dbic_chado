package Bio::Chado::Schema::Mage::Studyfactor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Studyfactor

=cut

__PACKAGE__->table("studyfactor");

=head1 ACCESSORS

=head2 studyfactor_id

  data_type: integer
  default_value: nextval('studyfactor_studyfactor_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 studydesign_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: text
  default_value: undef
  is_nullable: 0

=head2 description

  data_type: text
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "studyfactor_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('studyfactor_studyfactor_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "studydesign_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "type_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "name",
  { data_type => "text", default_value => undef, is_nullable => 0 },
  "description",
  { data_type => "text", default_value => undef, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("studyfactor_id");

=head1 RELATIONS

=head2 studydesign

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Studydesign>

=cut

__PACKAGE__->belongs_to(
  "studydesign",
  "Bio::Chado::Schema::Mage::Studydesign",
  { studydesign_id => "studydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 studyfactorvalues

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Studyfactorvalue>

=cut

__PACKAGE__->has_many(
  "studyfactorvalues",
  "Bio::Chado::Schema::Mage::Studyfactorvalue",
  { "foreign.studyfactor_id" => "self.studyfactor_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+SZOEBYVbj7Y6INxQjOjhA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
