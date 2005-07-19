# $Id: 05_zero_indent.t,v 1.3 2005-07-19 10:30:05 skim Exp $

print "-- Zero line_size.\n" if $debug;
my $next_indent = '  ';
my $obj = $class->new(
	'next_indent' => $next_indent,
	'line_size' => 0
);
my $tag = 'word1 word2 word3';
my $ret = $obj->indent($tag);
ok($ret, "word1\n".$next_indent."word2\n".$next_indent."word3");
