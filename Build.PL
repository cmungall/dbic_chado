use Module::Build;
my $build = Module::Build->new(
    module_name          => 'Bio::Chado::Schema',
    dist_name            => 'Bio-Chado-Schema',
    dist_abstract        => 'standard DBIx::Class layer for the Chado schema',
    license              => 'perl',
    recursive_test_files => 1,
    create_readme        => 1,
    add_to_cleanup       => [ 'Bio-Chado-Schema-*', 't/var' ],
    create_license       => 1,
    meta_merge           => {
        resources =>
          { repository => 'http://github.com/rbuels/Bio-Chado-Schema', },
    },
    build_requires => {
        'DBD::SQLite'     => '1.14',
        'SQL::Translator' => '0.11005',
        'Test::More'      => 0,
        'Test::Exception' => '0.27',
    },
    requires       => {
        'perl' => '5.8.0',

        # right now, we have to depend on whole bioperl, like this
        'Bio::Root::Version' => '1.005002',
        # keep SPECIFIC bioperl dependencies here, for when bioperl
        # is in smaller, versioned chunks
        # 'Bio::PrimarySeq' => '1.5.2',

        'Carp'        => 0,
        'Carp::Clan'  => '6.00',
        'DBIx::Class' => '0.08111',
        'DBIx::Class::Tree::NestedSet' => '0.07',
    },
);
$build->create_build_script;
