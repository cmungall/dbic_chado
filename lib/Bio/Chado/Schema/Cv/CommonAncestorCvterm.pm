package Bio::Chado::Schema::Cv::CommonAncestorCvterm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("common_ancestor_cvterm");
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


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z5WRLLvee/ZVpwUg17px1A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
