package Rust::Util;
use Moose::Role;
use namespace::autoclean;
use Carp qw( confess );
use Path::Class ();
use User::pwent ();

sub user {
    getpwuid($>||$<);
}

sub real_user {
    getpwuid($<);
}

sub file {
    my $self = shift;
    my @path = @_;
    @path || confess("No file arguments given");
    Path::Class::File->new(@path);
}

sub dir {
    my $self = shift;
    my @path = @_;
    @path || confess("No dir arguments given");
    Path::Class::dir->new(@path);
}

sub check_user {
    my $self = shift;
    my $check_user = shift || return;
    return
        blessed($check_user) ?
        $check_user->uid == $self->effective_user->uid : $check_user =~ /\A\d+\z/ ?
        $check_user == $self->effective_user->uid : $check_user eq $self->effective_user->name;
}

sub assert_user {
    my $self = shift;
    my $check_user = shift;
    $self->check_user($check_user)
        or $self->BAILOUT("Cannot continue as '$check_user,' with user ",
                          $self->user);
}

1;

__END__

=pod

=head1 Name

Rust::Util - L<Moose::Role> providing test utilities and helpers.

=head1 Synopsis

 # something...

=head1 Methods

=over 4

=item * user

A L<User::pwent> of C<$E<gt> || $E<lt>>.

=item * real_user

A L<User::pwent> of C<$E<lt>>.

=item * verbose

    A set/get hook to C<$ENV{TEST_VERBOSE}>.

=item * dump

A wrapper around L<Test::More/diag> and L<YAML/Dump>.

=item * diag

A wrapper around L<Test::More/diag>.

=item * file

A wrapper around L<Path::Class::File>. Gives error if no argument is given.

=item * dir

A wrapper around L<Path::Class::Dir>. Gives error if no argument is given.

=item * check_user

Takes a user name, a user id, or a L<User::pwent> object and returns a comparison of it to the L</effective_user>.

=item * assert_user

Runs L</check_user> and gives an error unless a match>

=back

=head1 To do

Utilities like the pod stubbers. Documentation suggestions. Spelling...?

=cut
