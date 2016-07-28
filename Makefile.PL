use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Date::Advent',
    AUTHOR           => q{Michael Wayne Arnold <marmanold@cpan.org>},
    VERSION_FROM     => 'lib/Date/Advent.pm',
    ABSTRACT         => 'Date::Advent takes a Time::Piece date and calculates all four Sundays of Advent for the current Christian liturgical year.',
    LICENSE          => 'perl_5',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.022000,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => '1.302040',
        'Test::CheckManifest' => '0.9',
        'Test::Exception' => '0.43', 
    },
    PREREQ_PM => {
        'Carp' => '1.38', 
        'Try::Tiny' => '0.24', 
        'Time::Piece' => '1.31',
        'Moose' => '2.1804', 
        'Date::Lectionary::Time' => '1.20160727',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Date-Lectionary-Time-*' },
);
