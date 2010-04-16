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

  data_type: 'integer'
  is_nullable: 1

=head2 type

  data_type: 'text'
  is_nullable: 1

=head2 attribute

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", is_nullable => 1 },
  "type",
  { data_type => "text", is_nullable => 1 },
  "attribute",
  { data_type => "character varying", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f2QnhoWPzlOW+HqjID52qQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
