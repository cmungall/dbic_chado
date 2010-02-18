package Bio::Chado::Schema::Composite::Gffatts;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::Gffatts

=cut

__PACKAGE__->table("gffatts");

=head1 ACCESSORS

=head2 feature_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 type

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 attribute

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: undef

=cut

__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "type",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "attribute",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:21:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u0ScQnuIbyUghlMVUgjuDA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
