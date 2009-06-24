package Chado::Schema::Library::LibraryFeature;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("library_feature");
__PACKAGE__->add_columns(
  "library_feature_id",
  {
    data_type => "integer",
    default_value => "nextval('library_feature_library_feature_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "library_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("library_feature_id");
__PACKAGE__->add_unique_constraint("library_feature_c1", ["library_id", "feature_id"]);
__PACKAGE__->belongs_to(
  "library",
  "Chado::Schema::Library::Library",
  { library_id => "library_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZpvuGF4Kd83it360kGaG9g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
