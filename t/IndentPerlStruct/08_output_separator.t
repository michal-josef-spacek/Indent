# $Id: 08_output_separator.t,v 1.1 2008-05-09 14:02:30 skim Exp $

print "Testing: Output separator.\n" if $debug;
my $obj = $class->new(
	'next_indent' => '',
	'output_separator' => '',
);
my $ret = "['1','2',],";
ok($obj->indent([1, 2]), $ret);
