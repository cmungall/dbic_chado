package Bio::Chado::Schema::Cv::CvRoot;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cv_root");
__PACKAGE__->add_columns(
  "cv_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "root_cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NsrmUkfwjQ3pcSn8k7+33Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
