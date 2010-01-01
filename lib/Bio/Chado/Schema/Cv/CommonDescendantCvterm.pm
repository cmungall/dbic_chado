package Bio::Chado::Schema::Cv::CommonDescendantCvterm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::CommonDescendantCvterm - The common descendant of
any two terms is the intersection of both terms descendants. Two terms
can have multiple common descendants. Use total_pathdistance to get
the least common ancestor

=cut

__PACKAGE__->table("common_descendant_cvterm");

=head1 ACCESSORS

=head2 cvterm1_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 cvterm2_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 ancestor_cvterm_id

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 pathdistance1

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 pathdistance2

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=head2 total_pathdistance

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "cvterm1_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "cvterm2_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "ancestor_cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "pathdistance1",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "pathdistance2",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "total_pathdistance",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GEv1hRONtGLOg4cpgYW1tw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
