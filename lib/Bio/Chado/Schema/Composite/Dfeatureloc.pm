package Bio::Chado::Schema::Composite::Dfeatureloc;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("dfeatureloc");
__PACKAGE__->add_columns(
  "featureloc_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "nbeg",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "is_nbeg_partial",
  { data_type => "boolean", default_value => undef, is_nullable => 1, size => 1 },
  "nend",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "is_nend_partial",
  { data_type => "boolean", default_value => undef, is_nullable => 1, size => 1 },
  "strand",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "phase",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "residue_info",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "locgroup",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "rank",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YiOek/3Lxu9mJXvEJF6MOg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
