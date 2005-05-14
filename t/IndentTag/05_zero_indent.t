# $Id: 05_zero_indent.t,v 1.2 2005-05-14 02:54:23 skim Exp $

print "-- Zero line_size.\n" if $debug;
my $next_indent = '  ';
$obj = $class->new(
	'next_indent' => $next_indent,
	'line_size' => 0
);
my $tag = '<tag param="value" param2="value2" param3="val3">';
my $ret = $obj->indent($tag);
ok($ret, "<tag\n".$next_indent."param=\"value\"\n".$next_indent.
	"param2=\"value2\"\n".$next_indent.'param3="val3">');
