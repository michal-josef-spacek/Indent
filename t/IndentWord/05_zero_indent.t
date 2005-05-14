# $Id: 05_zero_indent.t,v 1.1 2005-05-14 02:15:13 skim Exp $

print "-- Zero line_size.\n" if $debug;
my $next_indent = '  ';
$obj = new $class(
	'next_indent' => $next_indent,
	'line_size' => 0
);
my $tag = 'word1 word2 word3';
my $ret = $obj->indent($tag);
ok($ret, "word1\n".$next_indent."word2\n".$next_indent."word3");
