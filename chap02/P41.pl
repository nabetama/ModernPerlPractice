package MyObject;
use Moose;
use MooseX::AttributeHelpers;

has 'list' => (
    metaclass => 'Collection::Array',
    is => 'rw',
    isa => 'ArrayRef',
    default => sub { [] },
    provides => {
        push => 'push_list',
        pop  => 'pop_list',
    },
);

__PACKAGE__->meta->make_immutable;

no Moose;

package P41;

my $object = MyObject->new();
$object->push_list( 'abrc' );
print $object->pop_list(), "\n";
