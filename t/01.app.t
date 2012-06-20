#!/usr/bin/perl

use Test::More qw(no_plan);
use Roman::Numerals;

my $roman = new Roman::Numerals();

isa_ok($roman, "Roman::Numerals");