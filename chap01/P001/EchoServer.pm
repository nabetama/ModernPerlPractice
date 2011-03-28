package EchoServer;
use Moose;

has 'address' => (
    is       => 'rw',
    isa      => 'Str',
    required => 1,
);

has 'port' => (
    is       => 'rw',
    isa      => 'Int',
    required => 1,
    default  => 9999,
);

has 'server_socket' => (
    is       => 'rw',
    isa      => 'IO::Socket',
);

__PACKAGE__->meta->make_immutable;

no Moose;

# Mooseはここでおしまい。

use IO::Socket::INET;

sub bind {
    my $self = shift;

    my $socket = IO::Socket::INET->new(
        Listen    => 10,                # que size for listen
        LocalAddr => $self->address,    # Local host bind address
        LocalPort => $self->port,       # Local host bind port
        Proto     => 'tcp',             # protocol
    );

    if ( !$socket ) {
        die "can't make a socket: $@";
    }

    # Mooseのserver_socketを呼ぶ
    $self->server_socket( $socket );
}

# run server
#
sub run {
    my $self = shift;

    my $socket = $self->server_socket;

    while ( my $client = $socket->accept ) { # IO::Socketのaccept
        $self->process_request( $client );
    }
}


sub process_request {
    my ( $self, $client ) = @_;

    while ( ! $client->eof ) {
        my $req = $self->read_request($client);
        $self->write_response($client, $req);
    }
}


sub read_request {
    my ($self, $client) = @_;

    # 受け取ったリクエストをそのまま返す
    my $line = <$client>;
    return "The message that you input is $line";
}

sub write_response {
    my ($self, $client, $request) = @_;
    print $client $request;
}

1;


