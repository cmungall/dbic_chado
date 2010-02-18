package Bio::Chado::Schema::Sequence::Featureprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::Featureprop

=head1 DESCRIPTION

A feature can have any number of slot-value property tags attached to it. This is an alternative to hardcoding a list of columns in the relational schema, and is completely extensible.

=cut

__PACKAGE__->table("featureprop");

=head1 ACCESSORS

=head2 featureprop_id

  data_type: integer
  default_value: nextval('featureprop_featureprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 feature_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

The name of the
property/slot is a cvterm. The meaning of the property is defined in
that cvterm. Certain property types will only apply to certain feature
types (e.g. the anticodon property will only apply to tRNA features) ;
the types here come from the sequence feature property ontology.

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1

The value of the property, represented as text. Numeric values are converted to their text representation. This is less efficient than using native database types, but is easier to query.

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0

Property-Value ordering. Any
feature can have multiple values for any particular property type -
these are ordered in a list using rank, counting from zero. For
properties that are single-valued rather than multi-valued, the
default 0 value should be used

=cut

__PACKAGE__->add_columns(
  "featureprop_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('featureprop_featureprop_id_seq'::regclass)",
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
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("featureprop_id");
__PACKAGE__->add_unique_constraint("featureprop_c1", ["feature_id", "type_id", "rank"]);

=head1 RELATIONS

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

=head2 featureprop_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeaturepropPub>

=cut

__PACKAGE__->has_many(
  "featureprop_pubs",
  "Bio::Chado::Schema::Sequence::FeaturepropPub",
  { "foreign.featureprop_id" => "self.featureprop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tjxxfWlAJ1HECb2hy2XsnA

=head1 ADDITIONAL RELATIONSHIPS

=head2 cvterm

Alias for type ( type_id foreign key into cvterm table)

=cut

__PACKAGE__->belongs_to
    (
     'cvterm',
     'Bio::Chado::Schema::Cv::Cvterm',
     { 'foreign.cvterm_id' => 'self.type_id' },
    );



# You can replace this text with custom content, and it will be preserved on regeneration
1;
