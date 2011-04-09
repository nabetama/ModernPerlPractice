package MyObject;
use Moose;

has 'list' => (
    is  => 'rw',
    isa => 'ArrayRef',
    default => sub { [] },
);

__PACKAGE__->meta->make_immutable;

no Moose;

package P40;
use Data::Dumper;

my $obj = MyObject->new;

my $list = $obj->list;
push @$list, 'abc';
print "@$list[0]\n";
