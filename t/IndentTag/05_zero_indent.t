# $Id: 05_zero_indent.t,v 1.3 2005-07-19 10:30:04 skim Exp $

print "-- Zero line_size.\n" if $debug;
my $next_indent = '  ';
my $obj = $class->new(
	'next_indent' => $next_indent,
	'line_size' => 0
);
my $tag = '<tag param="value" param2="value2" param3="val3">';
my $ret = $obj->indent($tag);
ok($ret, "<tag\n".$next_indent."param=\"value\"\n".$next_indent.
	"param2=\"value2\"\n".$next_indent.'param3="val3">');
