package Bio::Chado::Schema::Companalysis::Analysisfeatureprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Companalysis::Analysisfeatureprop

=cut

__PACKAGE__->table("analysisfeatureprop");

=head1 ACCESSORS

=head2 analysisfeatureprop_id

  data_type: integer
  default_value: nextval('analysisfeatureprop_analysisfeatureprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 analysisfeature_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 rank

  data_type: integer
  default_value: undef
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "analysisfeatureprop_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('analysisfeatureprop_analysisfeatureprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "analysisfeature_id",
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
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => undef, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("analysisfeatureprop_id");
__PACKAGE__->add_unique_constraint(
  "analysisfeature_id_type_id_rank",
  ["analysisfeature_id", "type_id", "rank"],
);

=head1 RELATIONS

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

=head2 analysisfeature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Companalysis::Analysisfeature>

=cut

__PACKAGE__->belongs_to(
  "analysisfeature",
  "Bio::Chado::Schema::Companalysis::Analysisfeature",
  { analysisfeature_id => "analysisfeature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rxWMrxVupbPKUBeJukS/5Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
