#!/usr/bin/env perl
use warnings;
use strict;
use Test::More;

BEGIN {
    use_ok('Rust');
}


done_testing();

__END__

    prove -l t -v
