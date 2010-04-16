package Bio::Chado::Schema::Composite::FpKey;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::FpKey

=cut

__PACKAGE__->table("fp_key");

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  is_nullable: 1

=head2 pkey

  data_type: 'character varying'
  is_nullable: 1
  size: 1024

=head2 value

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", is_nullable => 1 },
  "pkey",
  { data_type => "character varying", is_nullable => 1, size => 1024 },
  "value",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gQVj1mN1TycPjJHjhgqi6Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
