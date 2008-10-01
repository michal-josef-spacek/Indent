print "Testing: No-indenting data.\n" if $debug;
my $obj = $class->new(
	'next_indent' => '',
	'line_size' => '1',
	'output_separator' => '-'
);
my $data = 'abcd';
my $ret = $obj->indent($data);
ok($ret, 'a-b-c-d');

