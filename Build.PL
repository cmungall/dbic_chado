use Module::Build;
my $build = Module::Build->new
    (
     module_name => 'Chado::Schema',
     dist_version => '0.01',
     dist_name    => 'dbic-chado',
     dist_abstract => 'standard DBIx::Class layer for the Chado schema',
     license  => 'perl',
     create_makefile_pl => 'passthrough',
     recursive_test_files => 1,

     requires => {
                  'perl'          => '5.8.0',
                  'DBIx::Class'   => '0.07',
                 },
    );
$build->create_build_script;
