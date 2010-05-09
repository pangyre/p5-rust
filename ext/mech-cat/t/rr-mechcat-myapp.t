#!/usr/bin/env perl
use FindBin qw($Bin);
use lib "$Bin/lib";
use MechCat::Test;

MechCat::Test->runtests();

__END__

   prove -I../../core/lib -l t/rr-mechcat-myapp.t -v
