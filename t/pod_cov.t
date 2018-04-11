#!/usr/bin/perl -w

use Test::More;
use strict;

my $tests;

BEGIN
   {
   $tests = 3;
   plan tests => $tests;
   chdir 't' if -d 't';
   use lib '../lib';
   };

SKIP:
  {
  skip("Test::Pod::Coverage 1.00 required for testing POD coverage", $tests)
    unless do {
    eval "use Test::Pod::Coverage 1.00";
    $@ ? 0 : 1;
    };
  for my $m (qw/
    Math::BigInt::Named
    Math::BigInt::Named::English
    Math::BigInt::Named::German
   /)
    {
    pod_coverage_ok( $m, "$m is covered" );
    }
  }

