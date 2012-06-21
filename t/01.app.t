#!/usr/bin/perl

use Test::More qw(no_plan);
use Roman::Numerals;

my $roman  = new Roman::Numerals();
my $got    = ();
my $expect = ();

isa_ok($roman, "Roman::Numerals");

# Splitting Arabic numbers into each digit multiply by its place value

@got    = $roman->get_place_values('0');
@expect = (0);
is_deeply(\@got, \@expect, "0   is (0)");

@got    = $roman->get_place_values('1');
@expect = (1);
is_deeply(\@got, \@expect, "1   is (1)");

@got    = $roman->get_place_values('50');
@expect = (50, 0);
is_deeply(\@got, \@expect, "50  is (50, 0)");

@got    = $roman->get_place_values('234');
@expect = (200, 30, 4);
is_deeply(\@got, \@expect, "200 is (200, 30, 4)");

# Basic Roman symbols

is($roman->to_roman(1),    "I", "1    -> I");
is($roman->to_roman(5),    "V", "5    -> V");
is($roman->to_roman(10),   "X", "10   -> X");
is($roman->to_roman(50),   "L", "50   -> L");
is($roman->to_roman(100),  "C", "100  -> C");
is($roman->to_roman(500),  "D", "500  -> D");
is($roman->to_roman(1000), "M", "1000 -> M");

# I, X, C, M can be repeated 3 times

is($roman->to_roman(2),    "II",  "2    -> II");
is($roman->to_roman(3),    "III", "5    -> III");
is($roman->to_roman(20),   "XX",  "20   -> XX");
is($roman->to_roman(30),   "XXX", "30   -> XXX");
is($roman->to_roman(200),  "CC",  "200  -> CC");
is($roman->to_roman(300),  "CCC", "300  -> CCC");
is($roman->to_roman(2000), "MM",  "2000 -> MM");
is($roman->to_roman(3000), "MMM", "3000 -> MMM");

# V, L, D cannot be repeated

isnt($roman->to_roman(10),   "VV",  "10   != VV");
isnt($roman->to_roman(15),   "VVV", "15   != VVV");
isnt($roman->to_roman(100),  "LL",  "100  != LL");
isnt($roman->to_roman(150),  "LLL", "150  != LLL");
isnt($roman->to_roman(1000), "DD",  "1000 != DD");
isnt($roman->to_roman(1500), "DDD", "1500 != DDD");

# I can be subtracted from V and X

is($roman->to_roman(4), "IV", "4 -> IV");
is($roman->to_roman(9), "IX", "9 -> IX");

# X can be subtracted from L and C

is($roman->to_roman(40), "XL", "40 -> XL");
is($roman->to_roman(90), "XC", "90 -> XC");

# C can be subtracted from D and M

is($roman->to_roman(400), "CD", "400 -> CD");
is($roman->to_roman(900), "CM", "900 -> CM");