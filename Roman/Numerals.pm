#!/usr/bin/perl

package Roman::Numerals;

sub new {
	my $class = shift;
	my $self  = {};

	bless $self, $class;
	return $self;
}

sub get_place_values {
	my ($self, $number) = @_;

	@values = ();
	@digits = split(//, $number);
	$square = $#digits;

	foreach my $digit (@digits) {
		push(@values, $digit * (10 ** $square));
		$square--;
	}

	return @values;
}

1;