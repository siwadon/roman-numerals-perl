#!/usr/bin/perl

use Test::More qw(no_plan);
use Roman::Numerals;

my $roman  = new Roman::Numerals();
my $got    = ();
my $expect = ();

isa_ok($roman, "Roman::Numerals");

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

is($roman->to_roman(1),    "I", "1    -> I");
is($roman->to_roman(5),    "V", "5    -> V");
is($roman->to_roman(10),   "X", "10   -> X");
is($roman->to_roman(50),   "L", "50   -> L");
is($roman->to_roman(100),  "C", "100  -> C");
is($roman->to_roman(500),  "D", "500  -> D");
is($roman->to_roman(1000), "M", "1000 -> M");