package Rust::Base;
use Moose::Role;
use namespace::autoclean;
use Carp qw( confess carp );
use Test::More ();
use YAML ();

# has dumper ?

sub verbose {
    my $self = shift;
    $ENV{TEST_VERBOSE} = shift if @_;
    $ENV{TEST_VERBOSE} || 0;
}

sub dump {
    my $self = shift;
    my @dump = @_ ? @_ : ( $self );
    Test::More::diag( YAML::Dump(@dump) );
}

sub diag {
    my $self = shift;
    my $output = shift || carp("Useless call to debug") && return;
    Test::More::diag( $output );
}

sub note {
    my $self = shift;
    my $output = shift || carp("Useless call to note") && return;
    Test::More::note( $output );
}

1;

__END__

=pod

=head1 Name

Rust::Util - L<Moose::Role> providing OO methods for standard L<Test::More> utilities.

=head1 Synopsis

 # something...

=head1 Methods

=over 4

=item * effective_user

A L<User::pwent> of C<$E<lt> || $E<gt>>.

=item * verbose

    A set/get hook to C<$ENV{TEST_VERBOSE}>.

=item * dump

A wrapper around L<Test::More/diag> and L<YAML/Dump>.

=item * diag

A wrapper around L<Test::More/diag>.

=back

=head1 To do

Utilities like the pod stubbers. Documentation suggestions. Spelling...?

=cut
