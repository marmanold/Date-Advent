package Date::Advent;

use v5.22;
use Moose;

use Carp;
use Try::Tiny;
use Time::Piece;
use Date::Lectionary::Time qw(nextSunday prevSunday);

=head1 NAME

Date::Advent

=head1 VERSION

Version 1.20160727

=cut

our $VERSION = '1.20160727';


=head1 SYNOPSIS

Date::Advent takes a Time::Piece date and calculates all four Sundays of Advent for the current Christian liturgical year.

As Advent is the beginning of the Christian liturgical calendar, this usually results in the date for Advent in the current year being dates in the past.  E.g. The Sundays of Advent returned for 12. March 2016 would be 29. November 2015, 6. December 2015, 13. December 2015, and 20. December 2015.

Perhaps a little code snippet.

    use Date::Advent;

    my $foo = Date::Advent->new();
    ...

=head1 SUBROUTINES/METHODS

=cut

has 'date' => (
	is => 'ro', 
	isa => 'Time::Piece',
);

has 'christmas' => (
	is => 'ro', 
	isa => 'Time::Piece',
	init_arg => undef,
	writer => '_setChristmas',
);

has 'firstSunday' => (
	is => 'ro',
	isa => 'Time::Piece',
	init_arg => undef,
	writer => '_setFirstSunday',
);

has 'secondSunday' => (
	is => 'ro',
	isa => 'Time::Piece',
	init_arg => undef,
	writer => '_setSecondSunday',
);

has 'thirdSunday' => (
	is => 'ro',
	isa => 'Time::Piece',
	init_arg => undef,
	writer => '_setThirdSunday',
);

has 'fourthSunday' => (
	is => 'ro',
	isa => 'Time::Piece',
	init_arg => undef,
	writer => '_setFourthSunday',
);

=head2 BUILD

Constructor for the Date::Advent object.  Takes the Time::Piece argument of date as the date to calculate the current Christian liturgical year's Sundays of Advent from.

=cut

sub BUILD {
	my $self = shift;

	my $xmasYear;
	if ($self->date->mon==11||$self->date->mon==12) {
		$xmasYear = $self->date->year;
	}
	else {
		$xmasYear = $self->date->year-1;
	}
	
	my $christmasDay = Time::Piece->strptime("$xmasYear-12-25", "%Y-%m-%d");
	
	my $fourthAdvent = prevSunday($christmasDay);
	my $thirdAdvent = prevSunday($fourthAdvent);
	my $secondAdvent = prevSunday($thirdAdvent);
	my $firstAdvent = prevSunday($secondAdvent);

	if ($self->date < $firstAdvent) {
		$christmasDay = $christmasDay->add_years(-1);
	
		$fourthAdvent = prevSunday($christmasDay);
		$thirdAdvent = prevSunday($fourthAdvent);
		$secondAdvent = prevSunday($thirdAdvent);
		$firstAdvent = prevSunday($secondAdvent);
	}

	$self->_setChristmas($christmasDay);
	$self->_setFirstSunday($firstAdvent);
	$self->_setSecondSunday($secondAdvent);
	$self->_setThirdSunday($thirdAdvent);
	$self->_setFourthSunday($fourthAdvent);
}



=head1 AUTHOR

Michael Wayne Arnold, C<< <marmanold at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-date-advent at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Date-Advent>.  I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Date::Advent


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Date-Advent>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Date-Advent>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Date-Advent>

=item * Search CPAN

L<http://search.cpan.org/dist/Date-Advent/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2016 Michael Wayne Arnold.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.


=cut

__PACKAGE__->meta->make_immutable;

1; # End of Date::Advent
