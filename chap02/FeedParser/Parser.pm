package FeedParser::Parser;
use Moose::Role;

requires qw/parse_file parse_handle parse_string/;

no Moose::Role;

1;
