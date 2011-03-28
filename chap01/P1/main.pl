#!/usr/bin/env perl
use strict;
use warnings;
use TimestampedEchoServer;

my $es = TimestampedEchoServer->new(address => "127.0.0.1", port => 9999);

$es->bind;
$es->run;

