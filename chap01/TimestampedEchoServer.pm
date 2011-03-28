package TimestampedEchoServer;
use Moose;

extends 'EchoServer';      # == use base qw/EchoServer/;

# write_response が実行される前に
# 参照している無名関数を実行する
before 'write_response' => sub {
    my ($self, $client, $request) = @_;
    print $client scalar(localtime), " ";
};

1;
