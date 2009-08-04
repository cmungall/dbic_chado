package DbicChadoTest::TestData;

sub create_test_organisms {
    my $class = shift;
    my $schema = shift;

    my @data = (
                { abbreviation => 'S. lycopersicum',
                  genus => 'Solanum',
                  species => 'lycopersicum',
                  common_name => 'Tomato',
                },
                { abbreviation => 'S. tuberosum',
                  genus => 'Solanum',
                  species => 'tuberosum',
                  common_name => 'Potato',
                },
               );

    $schema->resultset('Organism::Organism')->create( $_ )
        for @data;
}

1;
