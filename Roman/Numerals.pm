#!/usr/bin/perl

=head1 NAME

Roman::Numerals - Convert Arabic numerals to Roman numerals


=head1 SYNOPSIS

$obj = new Roman::Numerals();
$obj->convert(1999) will return "MCMXCIX"


=head1 AUTHOR

Siwadon Saosoong

=cut

package Roman::Numerals;

=head2 constructor

=cut

sub new {
	my $class = shift;
	my $self  = {};

	bless $self, $class;
	return $self;
}

=head2 get_place_values

=cut

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

=head2 to_roman

Convert Arabic number to Roman
Parameter can be only
- 1000, 2000, 3000
- 100, 200, 300, .., 900
- 10, 20, 30, .., 90
- 1, 2, 3, .., 9

=cut

sub to_roman {
	my ($self, $number) = @_;
	my $result = "";

	if ($number <= 0 or $number > 3000) {
		return 0;
	}

	if ($number % 1000 == 0) {
		$result = "M" x ($number / 1000);
	}
	elsif ($number == 900) {
		$result = "CM";
	}
	elsif ($number == 500) {
		$result = "D";
	}
	elsif ($number == 400) {
		$result = "CD";
	}
	elsif ($number % 100 == 0) {
		$result = "C" x ($number / 100);
	}
	elsif ($number == 90) {
		$result = "XC";
	}
	elsif ($number == 50) {
		$result = "L";
	}
	elsif ($number == 40) {
		$result = "XL";
	}
	elsif ($number % 10 == 0) {
		$result = "X" x ($number / 10);
	}
	elsif ($number == 9) {
		$result = "IX";
	}
	elsif ($number == 5) {
		$result = "V";
	}
	elsif ($number == 4) {
		$result = "IV";
	}
	else {
		$result = "I" x $number;
	}

	return $result;
}

1;