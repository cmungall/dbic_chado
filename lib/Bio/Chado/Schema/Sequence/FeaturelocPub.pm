package Bio::Chado::Schema::Sequence::FeaturelocPub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::FeaturelocPub - Provenance of featureloc. Linking table between featurelocs and publications that mention them.

=cut

__PACKAGE__->table("featureloc_pub");

=head1 ACCESSORS

=head2 featureloc_pub_id

  data_type: integer
  default_value: nextval('featureloc_pub_featureloc_pub_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 featureloc_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "featureloc_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('featureloc_pub_featureloc_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "featureloc_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("featureloc_pub_id");
__PACKAGE__->add_unique_constraint("featureloc_pub_c1", ["featureloc_id", "pub_id"]);

=head1 RELATIONS

=head2 featureloc

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Featureloc>

=cut

__PACKAGE__->belongs_to(
  "featureloc",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { featureloc_id => "featureloc_id" },
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


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BJp6v1yFMUX7q2H1KBho0g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
