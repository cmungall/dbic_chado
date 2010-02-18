package Bio::Chado::Schema::Library::LibrarypropPub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Library::LibrarypropPub

=cut

__PACKAGE__->table("libraryprop_pub");

=head1 ACCESSORS

=head2 libraryprop_pub_id

  data_type: integer
  default_value: nextval('libraryprop_pub_libraryprop_pub_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 libraryprop_id

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
  "libraryprop_pub_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('libraryprop_pub_libraryprop_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "libraryprop_id",
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
__PACKAGE__->set_primary_key("libraryprop_pub_id");
__PACKAGE__->add_unique_constraint("libraryprop_pub_c1", ["libraryprop_id", "pub_id"]);

=head1 RELATIONS

=head2 libraryprop

Type: belongs_to

Related object: L<Bio::Chado::Schema::Library::Libraryprop>

=cut

__PACKAGE__->belongs_to(
  "libraryprop",
  "Bio::Chado::Schema::Library::Libraryprop",
  { libraryprop_id => "libraryprop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8S49LesCnXGENmXoACh+OA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
