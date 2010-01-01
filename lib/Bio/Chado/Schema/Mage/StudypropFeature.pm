package Bio::Chado::Schema::Mage::StudypropFeature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::StudypropFeature

=cut

__PACKAGE__->table("studyprop_feature");

=head1 ACCESSORS

=head2 studyprop_feature_id

  data_type: integer
  default_value: nextval('studyprop_feature_studyprop_feature_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 studyprop_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 feature_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "studyprop_feature_id",
  {
    data_type => "integer",
    default_value => "nextval('studyprop_feature_studyprop_feature_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "studyprop_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("studyprop_feature_id");
__PACKAGE__->add_unique_constraint(
  "studyprop_feature_studyprop_id_key",
  ["studyprop_id", "feature_id"],
);

=head1 RELATIONS

=head2 studyprop

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Studyprop>

=cut

__PACKAGE__->belongs_to(
  "studyprop",
  "Bio::Chado::Schema::Mage::Studyprop",
  { studyprop_id => "studyprop_id" },
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

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ys51/YpJgp+yKevbt0B5eA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
