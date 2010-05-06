#!/usr/bin/env perl
use warnings;
use strict;
use Test::More tests => 1;

BEGIN {
    use_ok('Testy');
}



__END__

    prove -l t -v
