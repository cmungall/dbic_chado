package Bio::Chado::Schema::Mage::AssayProject;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::AssayProject - Link assays to projects.

=cut

__PACKAGE__->table("assay_project");

=head1 ACCESSORS

=head2 assay_project_id

  data_type: integer
  default_value: nextval('assay_project_assay_project_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 assay_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 project_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "assay_project_id",
  {
    data_type => "integer",
    default_value => "nextval('assay_project_assay_project_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "assay_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "project_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("assay_project_id");
__PACKAGE__->add_unique_constraint("assay_project_c1", ["assay_id", "project_id"]);

=head1 RELATIONS

=head2 project

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Project>

=cut

__PACKAGE__->belongs_to(
  "project",
  "Bio::Chado::Schema::General::Project",
  { project_id => "project_id" },
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


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pm0lKrCaqJmEKUeSd8OLew


# You can replace this text with custom content, and it will be preserved on regeneration
1;
