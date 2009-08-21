use Module::Build;
my $build = Module::Build->new
    (
     module_name => 'Bio::Chado::Schema',
     dist_version => '0.01_03',
     dist_name    => 'Bio-Chado-Schema',
     dist_abstract => 'standard DBIx::Class layer for the Chado schema',
     license  => 'perl',
     create_makefile_pl => 'passthrough',
     recursive_test_files => 1,
     create_readme => 1,
     create_license => 1,
     meta_merge => {
                    resources => {
                                  repository => 'http://github.com/rbuels/dbic_chado',
                                 },
                   },
     requires => {
                  'perl'          => '5.8.0',
                  'DBIx::Class'   => '0.07',
                 },
    );
$build->create_build_script;
