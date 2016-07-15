package Date::Advent;

use v5.22;
use Moose;

use Carp;
use Try::Tiny;
use Time::Piece;
use Date::Lectionary::Time qw(nextSunday prevSunday);

=head1 NAME

Date::Advent - The great new Date::Advent!

=head1 VERSION

Version 1.20160525

=cut

our $VERSION = '1.20160525';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Date::Advent;

    my $foo = Date::Advent->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=cut

has 'date' => (
	is => 'rw', 
	isa => 'Time::Piece',
);

has 'christmas' => (
	is => 'rw', 
	isa => 'Time::Piece',
	init_arg => undef,
);

has 'firstSunday' => (
	is => 'rw',
	isa => 'Time::Piece',
	init_arg => undef,
);

has 'secondSunday' => (
	is => 'rw',
	isa => 'Time::Piece',
	init_arg => undef,
);

has 'thirdSunday' => (
	is => 'rw',
	isa => 'Time::Piece',
	init_arg => undef,
);

has 'fourthSunday' => (
	is => 'rw',
	isa => 'Time::Piece',
	init_arg => undef,
);

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
	
	my $fourthAdvent = &prevSunday($christmasDay);
	my $thirdAdvent = &prevSunday($fourthAdvent);
	my $secondAdvent = &prevSunday($thirdAdvent);
	my $firstAdvent = &prevSunday($secondAdvent);

	if ($self->date < $firstAdvent) {
		$christmasDay = $christmasDay->add_years(-1);
	
		$fourthAdvent = &prevSunday($christmasDay);
		$thirdAdvent = &prevSunday($fourthAdvent);
		$secondAdvent = &prevSunday($thirdAdvent);
		$firstAdvent = &prevSunday($secondAdvent);
	}

	$self->christmas($christmasDay);
	$self->firstSunday($firstAdvent);
	$self->secondSunday($secondAdvent);
	$self->thirdSunday($thirdAdvent);
	$self->fourthSunday($fourthAdvent);
}



=head1 AUTHOR

Michael Wayne Arnold, C<< <michael at rnold.info> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-date-advent at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Date-Advent>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




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
