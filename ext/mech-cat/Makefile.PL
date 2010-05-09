#!/usr/bin/env perl
use inc::Module::Install;

name "Rust::Role::MechCat";
all_from "lib/Rust/Role/MechCat.pm";
repository "git://github.com/pangyre/p5-rust";

requires "Rust";
requires "Test::WWW::Mechanize::Catalyst";
requires "Catalyst::Runtime";

if ( $Module::Install::AUTHOR )
{
    system("pod2text lib/Rust/Role/MechCat.pm > README") == 0
        or die "Couldn't update the README file";
}

auto_install;

WriteAll;

__END__
