package Bio::Chado::Schema::Mage::Acquisitionprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("acquisitionprop");
__PACKAGE__->add_columns(
  "acquisitionprop_id",
  {
    data_type => "integer",
    default_value => "nextval('acquisitionprop_acquisitionprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "acquisition_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("acquisitionprop_id");
__PACKAGE__->add_unique_constraint("acquisitionprop_c1", ["acquisition_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "acquisition",
  "Bio::Chado::Schema::Mage::Acquisition",
  { acquisition_id => "acquisition_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fqBZOYsHsDtK/9XlsFjc7g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
