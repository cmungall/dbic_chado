package Bio::Chado::Schema::Phylogeny::Phylonodeprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Phylogeny::Phylonodeprop

=cut

__PACKAGE__->table("phylonodeprop");

=head1 ACCESSORS

=head2 phylonodeprop_id

  data_type: integer
  default_value: nextval('phylonodeprop_phylonodeprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 phylonode_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

type_id could designate phylonode hierarchy relationships, for example: species taxonomy (kingdom, order, family, genus, species), "ortholog/paralog", "fold/superfold", etc.

=head2 value

  data_type: text
  default_value: (empty string)
  is_nullable: 0

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "phylonodeprop_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('phylonodeprop_phylonodeprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "phylonode_id",
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
    is_nullable    => 0,
  },
  "value",
  { data_type => "text", default_value => "", is_nullable => 0 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("phylonodeprop_id");
__PACKAGE__->add_unique_constraint(
  "phylonodeprop_phylonode_id_key",
  ["phylonode_id", "type_id", "value", "rank"],
);

=head1 RELATIONS

=head2 phylonode

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=cut

__PACKAGE__->belongs_to(
  "phylonode",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "phylonode_id" },
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
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BGBWZ1muEzar2p+xHRM1sQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
