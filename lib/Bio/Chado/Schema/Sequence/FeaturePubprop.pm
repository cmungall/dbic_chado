package Bio::Chado::Schema::Sequence::FeaturePubprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::FeaturePubprop - Property or attribute of a feature_pub link.

=cut

__PACKAGE__->table("feature_pubprop");

=head1 ACCESSORS

=head2 feature_pubprop_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'feature_pubprop_feature_pubprop_id_seq'

=head2 feature_pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: 'text'
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "feature_pubprop_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "feature_pubprop_feature_pubprop_id_seq",
  },
  "feature_pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "text", is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("feature_pubprop_id");
__PACKAGE__->add_unique_constraint("feature_pubprop_c1", ["feature_pub_id", "type_id", "rank"]);

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 feature_pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::FeaturePub>

=cut

__PACKAGE__->belongs_to(
  "feature_pub",
  "Bio::Chado::Schema::Sequence::FeaturePub",
  { feature_pub_id => "feature_pub_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Cx5f+yCIeuqkEtfpPlb+nw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
