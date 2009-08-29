package Bio::Chado::Schema::Cv::CvLeaf;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cv_leaf");
__PACKAGE__->add_columns(
  "cv_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oq/azg7+3W34Mu8RWwr2WQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
