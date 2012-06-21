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

	my %roman = (
		'3000' => "MMM",
		'2000' => "MM",
		'1000' => "M",
		'900'  => "CM",
		'800'  => "DCCC",
		'700'  => "DCC",
		'600'  => "DC",
		'500'  => "D",
		'400'  => "CD",
		'300'  => "CCC",
		'200'  => "CC",
		'100'  => "C",
		'90'   => "XC",
		'80'   => "LXXX",
		'70'   => "LXX",
		'60'   => "LX",
		'50'   => "L",
		'40'   => "XL",
		'30'   => "XXX",
		'20'   => "XX",
		'10'   => "X",
		'9'    => "IX",
		'8'    => "VIII",
		'7'    => "VII",
		'6'    => "VI",
		'5'    => "V",
		'4'	   => "IV",
		'3'    => "III",
		'2'    => "II",
		'1'    => "I"
	);

	return $roman{$number};
}

sub convert {
	my ($self, $number) = @_;

	if ($number <= 0 or $number > 3000) {
		return 0;
	}

	my @digits = $self->get_place_values($number);
	my $result = "";

	foreach $digit (@digits) {
		$result .= $self->to_roman($digit);
	}

	return $result;
}

1;