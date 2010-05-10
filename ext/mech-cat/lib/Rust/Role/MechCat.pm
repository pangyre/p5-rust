package Rust::Role::MechCat;
use Moose::Role;
# requires qw( catalyst_app );

has "catalyst_app" =>
    isa => "Str",
    is => "rw",
    ;

has "mech" =>
    isa => "Test::WWW::Mechanize::Catalyst",
    is => "ro",
    predicate => "mech_initialized",
    required => 1,
    lazy => 1,
    default => sub {
        my $self = shift;
        require Test::WWW::Mechanize::Catalyst;
        Test::WWW::Mechanize::Catalyst->new(catalyst_app => $self->catalyst_app);
    },
    handles => [qw(
                   get
                   get_ok
                   ct
                   title_is
                   title_like
                   content_like
                   content_contains
                   text_like
                   text_contains
                   follow_link_ok
                   page_links_ok
                   uri
                   status
                   host
                   )],
    ;

# These SHOULD BE an auxiliary method for Test::WWW::Mechanize. Send patch to Andy.
# diff -urN Test-WWW-Mechanize-1.28/Mechanize.pm TWM/Mechanize.pm
{
    package Test::WWW::Mechanize;
    use warnings;
    use strict;

    sub text_contains {
        my ( $self, $target, $desc ) = @_;
        local $Test::Builder::Level = $Test::Builder::Level + 1;
        if ( ref($target) eq 'REGEX' ) {
            diag('text_contains takes a string, not a regex');
        }
        $desc = qq{Text contains "$target"} unless defined $desc;
        contains_string( $self->content(format => "text"), $target, $desc );
    }

    sub text_like {
        my ( $self, $regex, $desc ) = @_;
        $desc = qq{Text is like "$regex"} unless defined $desc;
        local $Test::Builder::Level = $Test::Builder::Level + 1;
        like_string( $self->content(format => "text"), $regex, $desc );
    }
}

1;

__END__

=pod

=head1 NAME

Rust::Role::MechCat - L<Moose::Role> providing a L<Test::WWW::Mechanize::Catalyst> via the method C<mech>.

=head1 SYNOPSIS

 # something...

=head1 METHODS

=over 4

=item * mech

Readonly, returns a L<Test::WWW::Mechanize::Catalyst> object. The C<mech> object handles methods from L<Test::WWW::Mechanize::Catalyst> like C<get_ok> and C<title_like>. Please refer to that documentation for more.

=head2 New Methods

New methods are injected into the L<Test::WWW::Mechanize> space-

=item * text_contains

=item * text_like

=back

=head1 Copyright and License

See L<Rust>.

=cut
