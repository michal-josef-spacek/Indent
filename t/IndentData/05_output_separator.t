# $Id: 05_output_separator.t,v 1.2 2005-07-19 10:30:02 skim Exp $

print "Testing: No-indenting data.\n" if $debug;
my $obj = $class->new(
	'next_indent' => '',
	'line_size' => '1',
	'output_separator' => '-'
);
my $data = 'abcd';
my $ret = $obj->indent($data);
ok($ret, 'a-b-c-d');

