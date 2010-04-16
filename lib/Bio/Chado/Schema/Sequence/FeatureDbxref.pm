package Bio::Chado::Schema::Sequence::FeatureDbxref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::FeatureDbxref

=head1 DESCRIPTION

Links a feature to dbxrefs. This is for secondary identifiers; primary identifiers should use feature.dbxref_id.

=cut

__PACKAGE__->table("feature_dbxref");

=head1 ACCESSORS

=head2 feature_dbxref_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'feature_dbxref_feature_dbxref_id_seq'

=head2 feature_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 is_current

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

True if this secondary dbxref is the most up to date accession in the corresponding db. Retired accessions should set this field to false

=cut

__PACKAGE__->add_columns(
  "feature_dbxref_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "feature_dbxref_feature_dbxref_id_seq",
  },
  "feature_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "is_current",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("feature_dbxref_id");
__PACKAGE__->add_unique_constraint("feature_dbxref_c1", ["feature_id", "dbxref_id"]);

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:O0/d3CLYka4gR5AYmyxS4A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
