package Bio::Chado::Schema::Cv::CvLeaf;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::CvLeaf

=head1 DESCRIPTION

the leaves of a cv are the set of terms
which have no children (terms that are not the object of a
relation). All cvs will have at least 1 leaf

=cut

__PACKAGE__->table("cv_leaf");

=head1 ACCESSORS

=head2 cv_id

  data_type: 'integer'
  is_nullable: 1

=head2 cvterm_id

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "cv_id",
  { data_type => "integer", is_nullable => 1 },
  "cvterm_id",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1VCW73X/l+A4ncb5QuUosA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
