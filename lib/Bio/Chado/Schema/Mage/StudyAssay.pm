package Bio::Chado::Schema::Mage::StudyAssay;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::StudyAssay

=cut

__PACKAGE__->table("study_assay");

=head1 ACCESSORS

=head2 study_assay_id

  data_type: integer
  default_value: nextval('study_assay_study_assay_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 study_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 assay_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "study_assay_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('study_assay_study_assay_id_seq'::regclass)",
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
  "assay_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("study_assay_id");
__PACKAGE__->add_unique_constraint("study_assay_c1", ["study_id", "assay_id"]);

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

=head2 assay

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Assay>

=cut

__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IWv0D5CQeb8AFoAkjYZ7RQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
