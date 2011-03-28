package Bat;
use Moose;
extends 'Mammal';
with 'Winged';

sub fly {
    print "It is not a batman. It is a bat. \n";
}

1;

