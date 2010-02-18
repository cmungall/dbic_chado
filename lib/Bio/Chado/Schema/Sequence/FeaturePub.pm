package Bio::Chado::Schema::Sequence::FeaturePub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::FeaturePub

=head1 DESCRIPTION

Provenance. Linking table between features and publications that mention them.

=cut

__PACKAGE__->table("feature_pub");

=head1 ACCESSORS

=head2 feature_pub_id

  data_type: integer
  default_value: nextval('feature_pub_feature_pub_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 feature_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "feature_pub_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('feature_pub_feature_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "feature_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "pub_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("feature_pub_id");
__PACKAGE__->add_unique_constraint("feature_pub_c1", ["feature_id", "pub_id"]);

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=head2 feature_pubprops

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeaturePubprop>

=cut

__PACKAGE__->has_many(
  "feature_pubprops",
  "Bio::Chado::Schema::Sequence::FeaturePubprop",
  { "foreign.feature_pub_id" => "self.feature_pub_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZKr5z2mgx8w4x3638RzLsw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
