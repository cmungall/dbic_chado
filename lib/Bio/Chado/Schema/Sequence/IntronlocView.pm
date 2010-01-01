package Bio::Chado::Schema::Sequence::IntronlocView;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::IntronlocView

=cut

__PACKAGE__->table("intronloc_view");

=head1 ACCESSORS

=head2 exon1_id

=head2 exon2_id

=head2 fmin

=head2 fmax

=head2 strand

=head2 srcfeature_id

=cut

__PACKAGE__->add_columns(
  "exon1_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "exon2_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "fmin",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "fmax",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "strand",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:e9ICn/AEYDo89oaJqnCdEQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
