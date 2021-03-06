# NAME

Date::Advent - Calculate the Sundays of Advent

# VERSION

Version 1.20180423

# SYNOPSIS

Date::Advent takes a Time::Piece date and calculates all four Sundays of Advent for the current Christian liturgical year.

As Advent is the beginning of the Christian liturgical calendar, this usually results in the date for Advent in the current year being dates in the past.  E.g. The Sundays of Advent returned for 12. March 2016 would be 29. November 2015, 6. December 2015, 13. December 2015, and 20. December 2015.

    use Time::Piece;
    use Date::Advent;

    my $testAdvent = Date::Advent->new(date => Time::Piece->strptime("2016-01-01", "%Y-%m-%d"));
    say $testAdvent->firstSunday; #Gives date for first Sunday of Advent
    say $testAdvent->secondSunday; #Gives date for second Sunday of Advent
    say $testAdvent->thirdSunday; #Gives date for third Sunday of Advent
    say $testAdvent->fourthSunday; #Gives date for fourth Sunday of Advent
    say $testAdvent->christmas; #Gives date of Christmas

# Object Attributes

## date

Time::Piece date object.  Only attribute required at object construction.

## christmas

Time::Piece attribute for Christmas Day as calculated from the `date` given at object construction.

## firstSunday

Time::Piece attribute for the first Sunday of Advent as calculated from the `date` given at object construction.

## secondSunday

Time::Piece attribute for the second Sunday of Advent as calculated from the `date` given at object construction.

## thirdSunday

Time::Piece attribute for the third Sunday of Advent as calculated from the `date` given at object construction.

## fourthSunday

Time::Piece attribute for the fourth Sunday of Advent as calculated from the `date` given at object construction.

# Object Constructor

## BUILD

Constructor for the Date::Advent object.  Takes the Time::Piece argument of `date` as the date to calculate the current Christian liturgical year's Sundays of Advent from.  The resulting object is immutable and cannot be changed once created.

    my $testAdvent = Date::Advent->new(date => Time::Piece->strptime("2016-01-01", "%Y-%m-%d"));

# AUTHOR

Michael Wayne Arnold, `<michael at rnold.info>`

# BUGS

<div>
    <a href='https://travis-ci.org/marmanold/Date-Advent'><img src='https://travis-ci.org/marmanold/Date-Advent.svg?branch=master' /></a>
</div>

<div>
    <a href='https://coveralls.io/github/marmanold/Date-Advent?branch=master'><img src='https://coveralls.io/repos/github/marmanold/Date-Advent/badge.svg?branch=master' alt='Coverage Status' /></a>
</div>

Please report any bugs or feature requests to `bug-date-advent at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Date-Advent](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Date-Advent).  I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Date::Advent

You can also look for information at:

- RT: CPAN's request tracker (report bugs here)

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=Date-Advent](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Date-Advent)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/Date-Advent](http://annocpan.org/dist/Date-Advent)

- CPAN Ratings

    [http://cpanratings.perl.org/d/Date-Advent](http://cpanratings.perl.org/d/Date-Advent)

- Search CPAN

    [http://search.cpan.org/dist/Date-Advent/](http://search.cpan.org/dist/Date-Advent/)

# ACKNOWLEDGEMENTS

Many thanks to my beautiful wife, Jennifer, my amazing daughter, Rosemary, and my sweet son, Oliver.  But, above all, SOLI DEO GLORIA!

# LICENSE

Copyright 2016-2018 MICHAEL WAYNE ARNOLD

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1\. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2\. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
