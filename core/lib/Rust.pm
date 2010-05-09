package Rust;
use Moose ();
use Moose::Exporter;

Moose::Exporter->setup_import_methods(
    with_meta => [],
    also      => 'Moose',
    );


sub init_meta {
    shift;
    return Moose->init_meta( @_,
                             metaclass => 'MyApp::Meta::Class',
                             #for_class  => "Rust",
                             # metaclass  => 'MooseX::Embiggen::Meta::Class',
                             base_class => "Test::Class",
        );

}

package MyApp::Meta::Class;
use Moose;

extends qw( Moose::Meta::Class Test::Class );


1;

__END__

package Rust;
use Moose;
use Moose::Exporter;
#use namespace::autoclean;

extends qw( Test::Class Moose::Object );
use Test::More ();

#*ok = \&Test::More::ok;
#@Rust::EXPORT = qw( ok );


use Moose::Exporter;
#Moose::Exporter->setup_import_methods(
#    with_meta => [ "with" ],
#    as_is     => [ "with" ],
#    also      => 'Moose',
#    );

#print "OK ", ok(1), $/;

1;

__END__



Moose->init_meta(for_class => __PACKAGE__,
                 base_class => "Test::Class",
                 metaclass => "Rust::Meta::Class");

BEGIN {
    package Rust::Meta::Class;
    use Moose;
    extends "Moose::Meta::Class";

}


 @Rust::EXPORT = qw( ok isa_ok );

 *isa_ok = \&Test::More::isa_ok;

#use Moose::Exporter;
#Moose::Exporter->setup_import_methods( also => "Moose" );


 __PACKAGE__->meta->make_immutable( inline_constructor => 0 );

1;

__DATA__

use Sub::Exporter -setup => {
    exports => [
        isa_ok => \&Test::More::isa_ok,
        ],
};

=pod

=head1 Name

Rust - A L<Moose> + L<Test::Class> testing framework.

=head1 Synopsis

=head1 Name

=over 4

=item *

=back

=head1 Code Repository

L<http://github.com/pangyre/p5-rust>.

=head1 See Also


=head1 Author

Ashley Pond V E<middot> ashley.pond.v@gmail.com E<middot> L<http://pangyresoft.com>.

=head1 License

You may redistribute and modify this package under the same terms as Perl itself.

=head1 Disclaimer of Warranty

Because this software is licensed free of charge, there is no warranty
for the software, to the extent permitted by applicable law. Except when
otherwise stated in writing the copyright holders and other parties
provide the software "as is" without warranty of any kind, either
expressed or implied, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose. The
entire risk as to the quality and performance of the software is with
you. Should the software prove defective, you assume the cost of all
necessary servicing, repair, or correction.

In no event unless required by applicable law or agreed to in writing
will any copyright holder, or any other party who may modify or
redistribute the software as permitted by the above license, be
liable to you for damages, including any general, special, incidental,
or consequential damages arising out of the use or inability to use
the software (including but not limited to loss of data or data being
rendered inaccurate or losses sustained by you or third parties or a
failure of the software to operate with any other software), even if
such holder or other party has been advised of the possibility of
such damages.

=cut

use MooseX::StrictConstructor;

sub new {
    my $class = shift;
    my $obj = $class->SUPER::new(@_);

      return $class->meta->new_object(
          __INSTANCE__ => $obj,
          @_,
          );
}
# extends qw( Test::Class  );
#with qw( Rust::Base Rust::Util );
# use Test::More;

#BEGIN { extends qw( Test::Class ) }
# BEGIN { use Test::Class }
# BEGIN { extends qw( Test::Class Exporter ) };
