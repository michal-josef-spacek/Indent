# $Id: 05_output_separator.t,v 1.1 2005-05-27 20:25:05 skim Exp $

print "Testing: No-indenting data.\n" if $debug;
$obj = $class->new(
	'next_indent' => '',
	'line_size' => '1',
	'output_separator' => '-'
);
my $data = 'abcd';
my $ret = $obj->indent($data);
ok($ret, 'a-b-c-d');

