#!/usr/bin/perl

package Roman::Numerals;

sub new {
	my $class = shift;
	my $self  = {};

	bless $self, $class;
	return $self;
}

1;