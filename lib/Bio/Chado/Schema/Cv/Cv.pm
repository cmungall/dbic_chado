package Bio::Chado::Schema::Cv::Cv;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cv");
__PACKAGE__->add_columns(
  "cv_id",
  {
    data_type => "integer",
    default_value => "nextval('cv_cv_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "definition",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("cv_id");
__PACKAGE__->add_unique_constraint("cv_c1", ["name"]);
__PACKAGE__->has_many(
  "cvterms",
  "Bio::Chado::Schema::Cv::Cvterm",
  { "foreign.cv_id" => "self.cv_id" },
);
__PACKAGE__->has_many(
  "cvtermpaths",
  "Bio::Chado::Schema::Cv::Cvtermpath",
  { "foreign.cv_id" => "self.cv_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kULi8FbmG/rToAmZjEPH7A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
