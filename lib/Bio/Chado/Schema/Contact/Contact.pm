package Bio::Chado::Schema::Contact::Contact;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("contact");
__PACKAGE__->add_columns(
  "contact_id",
  {
    data_type => "integer",
    default_value => "nextval('contact_contact_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
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
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("contact_id");
__PACKAGE__->add_unique_constraint("contact_c1", ["name"]);
__PACKAGE__->has_many(
  "contact_relationship_object_ids",
  "Bio::Chado::Schema::Contact::ContactRelationship",
  { "foreign.object_id" => "self.contact_id" },
);
__PACKAGE__->has_many(
  "contact_relationship_subject_ids",
  "Bio::Chado::Schema::Contact::ContactRelationship",
  { "foreign.subject_id" => "self.contact_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8SaVE7IaHw+VHqepY3BcwA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
