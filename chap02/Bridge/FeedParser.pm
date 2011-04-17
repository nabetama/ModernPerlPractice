package FeedParser;
use Moose;

has 'parser' => (
    is => 'rw',
    does => 'FeedParser::Parser',
    required => 1,
    handles => [ qw/parse_file parse_handle parse_string/ ],
);

__PACKAGE__->meta->make_immutable;

no Moose;

1;
