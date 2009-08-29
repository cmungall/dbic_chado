package Bio::Chado::Schema::Stock::Stockcollection;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stockcollection");
__PACKAGE__->add_columns(
  "stockcollection_id",
  {
    data_type => "integer",
    default_value => "nextval('stockcollection_stockcollection_id_seq'::regclass)",
    is_auto_increment => 1,
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
  "contact_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("stockcollection_id");
__PACKAGE__->add_unique_constraint("stockcollection_c1", ["uniquename", "type_id"]);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "contact",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "contact_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->has_many(
  "stockcollectionprops",
  "Bio::Chado::Schema::Stock::Stockcollectionprop",
  { "foreign.stockcollection_id" => "self.stockcollection_id" },
);
__PACKAGE__->has_many(
  "stockcollection_stocks",
  "Bio::Chado::Schema::Stock::StockcollectionStock",
  { "foreign.stockcollection_id" => "self.stockcollection_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rbpWB1J+JUUPBHE/L80yeQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
