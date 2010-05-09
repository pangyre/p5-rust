package TR; # TestRust
#use parent "Rust";
use Rust;
#with qw( Rust::Role::MechCat );
use Test::More;

sub oh_noes : Test(1) {
    my $self = shift;
    ok(1, "Ok here");
    return "...";

}

1;

__END__

=pod 

 perl -Ilib -It/lib -MTR -e "TR->runtests"

=cut
