package Pigeon;
use Moose;
extends 'Bird';
with 'Winged';

sub fly {
    print "I walk while shaking the neck back and forth. \n";
}

1;
