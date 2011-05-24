# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Word;
use Test::More 'tests' => 1;

print "-- Zero line_size.\n";
my $next_indent = '  ';
my $obj = Indent::Word->new(
	'next_indent' => $next_indent,
	'line_size' => 0,
);
my $tag = 'word1 word2 word3';
my $ret = $obj->indent($tag);
is($ret, "word1\n".$next_indent."word2\n".$next_indent."word3");
