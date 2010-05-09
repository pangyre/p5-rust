package TR; # TestRust
use Rust;
with qw( Rust::Role::MechCat );
# use Test::More;

has "an_okay_attribute" =>
    is => "rw",
    isa => "Str",
    ;

sub catalyst_app { "" }

sub oh_noes : Test(1) {
    my $self = shift;
    $self->an_okay_attribute("OH HAI");
    ok($self->an_okay_attribute, "Ok here");
}

1;

__END__

=pod 

 perl -Ilib -It/lib -MTR -e "TR->runtests"

 perl -Ilib -It/lib -I../ext/mech-cat/lib -MTR -e "TR->runtests"

=cut
