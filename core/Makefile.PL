#!/usr/bin/env perl
use inc::Module::Install;

name "Rust";
all_from "lib/Rust.pm";
repository "git://github.com/pangyre/p5-rust";

#build_requires "Pod::Spell";
#build_requires "Test::Spelling";

requires "Moose";
requires "Test::Class";
requires "Moose::Role";
# requires "Try::Tiny";

if ( $Module::Install::AUTHOR )
{
    system("pod2text lib/Rust.pm > README") == 0
        or die "Couldn't update the README file";
}

#Create dirs qw( etc var...? )

#install_script glob("bin/*");

auto_install;

WriteAll;

__END__
