package Chado::Schema::Sequence::Synonym;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("synonym");
__PACKAGE__->add_columns(
  "synonym_id",
  {
    data_type => "integer",
    default_value => "nextval('synonym_synonym_id_seq'::regclass)",
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
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "synonym_sgml",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("synonym_id");
__PACKAGE__->add_unique_constraint("synonym_c1", ["name", "type_id"]);
__PACKAGE__->add_unique_constraint("synonym_pkey", ["synonym_id"]);
__PACKAGE__->has_many(
  "feature_synonyms",
  "Chado::Schema::Sequence::FeatureSynonym",
  { "foreign.synonym_id" => "self.synonym_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hTH0pInB+RUyB0ZtLzFNTA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
