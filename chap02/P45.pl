use strict;
use FeedParser;
use FeedParser::Parser::RSS;
use FeedParser::Parser::Atom;

my $rss  = FeedParser->new( parser => FeedParser::Parser::RSS->new() );
my $atom = FeedParser->new( parser => FeedParser::Parser::Atom->new() );

$rss->parse_file( 'rss.xml' );
$atom->parse_file( 'atom.xml' );
