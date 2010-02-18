package Bio::Chado::Schema::Map::FeaturemapPub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Map::FeaturemapPub

=cut

__PACKAGE__->table("featuremap_pub");

=head1 ACCESSORS

=head2 featuremap_pub_id

  data_type: integer
  default_value: nextval('featuremap_pub_featuremap_pub_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 featuremap_id

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
  "featuremap_pub_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('featuremap_pub_featuremap_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "featuremap_id",
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
__PACKAGE__->set_primary_key("featuremap_pub_id");

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

=head2 featuremap

Type: belongs_to

Related object: L<Bio::Chado::Schema::Map::Featuremap>

=cut

__PACKAGE__->belongs_to(
  "featuremap",
  "Bio::Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CFzf9dzWDudPrwttptE3Cw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
