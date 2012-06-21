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

# I can be subtracted from V and X only

is($roman->to_roman(4), "IV", "4 -> IV");
is($roman->to_roman(9), "IX", "9 -> IX");

isnt($roman->convert(49),  "IL", "49  != IL");
isnt($roman->convert(99),  "IC", "99  != IC");
isnt($roman->convert(499), "ID", "499 != ID");
isnt($roman->convert(999), "IM", "999 != IM");

# X can be subtracted from L and C only

is($roman->to_roman(40), "XL", "40 -> XL");
is($roman->to_roman(90), "XC", "90 -> XC");

isnt($roman->convert(490), "XD", "490 != XD");
isnt($roman->convert(990), "XM", "990 != XM");

# C can be subtracted from D and M

is($roman->to_roman(400), "CD", "400 -> CD");
is($roman->to_roman(900), "CM", "900 -> CM");

# V cannot be subtracted

isnt($roman->to_roman(5),  "VX", "5   != VX");
isnt($roman->convert(45),  "VL", "45  != VL");
isnt($roman->convert(95),  "VC", "95  != VC");
isnt($roman->convert(495), "VD", "495 != VD");
isnt($roman->convert(995), "VM", "995 != VM");

# L cannot be subtracted

isnt($roman->to_roman(50),  "LC", "50  != LC");
isnt($roman->to_roman(450), "LD", "450 != LD");
isnt($roman->to_roman(950), "LM", "950 != LM");

# C cannot be subtracted

isnt($roman->to_roman(500), "DM", "500 != DM");

# I can be added to V

is($roman->to_roman(6), "VI",   "6 -> VI");
is($roman->to_roman(7), "VII",  "7 -> VII");
is($roman->to_roman(8), "VIII", "8 -> VIII");

# X can be added to L

is($roman->to_roman(60), "LX",   "60 -> LX");
is($roman->to_roman(70), "LXX",  "70 -> LXX");
is($roman->to_roman(80), "LXXX", "80 -> LXXX");

# C can be added to D

is($roman->to_roman(600), "DC",   "600 -> DC");
is($roman->to_roman(700), "DCC",  "700 -> DCC");
is($roman->to_roman(800), "DCCC", "800 -> DCCC");

# Converting begin
is($roman->convert(1),  "I",    "1  -> I");
is($roman->convert(2),  "II",   "2  -> II");
is($roman->convert(3),  "III",  "3  -> III");
is($roman->convert(4),  "IV",   "4  -> IV");
is($roman->convert(5),  "V",    "5  -> V");
is($roman->convert(6),  "VI",   "6  -> VI");
is($roman->convert(7),  "VII",  "7  -> VII");
is($roman->convert(8),  "VIII", "8  -> VIII");
is($roman->convert(9),  "IX",   "9  -> IX");
is($roman->convert(10), "X",    "10 -> X");