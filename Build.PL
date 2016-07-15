use v5.22;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Date::Advent',
    license             => 'perl_5',
    dist_author         => q{Michael Wayne Arnold <michael@rnold.info>},
    dist_version_from   => 'lib/Date/Advent.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    add_to_cleanup     => [ 'Date-Advent-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
$builder->dispatch('build');
$builder->dispatch('test', verbose => 1);