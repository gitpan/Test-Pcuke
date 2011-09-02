use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Test::Pcuke',
    license             => 'perl',
    dist_author         => q{"Andrei V. Toutoukine" <"tut@isuct.ru">},
    dist_version_from   => 'lib/Test/Pcuke.pm',
    build_requires => {
        'Test::Most'	=> 0,
    },
    add_to_cleanup      => [ 'Test-Pcuke-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
