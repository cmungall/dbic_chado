package # hide from PAUSE
    BCSTest::Schema;

use base qw/DBIx::Class::Schema/;

no warnings qw/qw/;

__PACKAGE__->load_classes;

sub sqlt_deploy_hook {
  my ($self, $sqlt_schema) = @_;

  $sqlt_schema->drop_table('dummy');
}

1;
