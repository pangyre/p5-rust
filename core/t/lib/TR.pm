package TR; # TestRust
use Rust;
with qw( Rust::Role::MechCat );
use Test::More;

sub catalyst_app { "" }

sub oh_noes : Test(1) {
    my $self = shift;
    ok(1, "Ok here");
    return "...";

}

1;

__END__

=pod 

 perl -Ilib -It/lib -MTR -e "TR->runtests"

 perl -Ilib -It/lib -I../ext/mech-cat/lib -MTR -e "TR->runtests"

=cut
