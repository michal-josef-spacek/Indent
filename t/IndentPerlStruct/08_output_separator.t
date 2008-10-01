print "Testing: Output separator.\n" if $debug;
my $obj = $class->new(
	'next_indent' => '',
	'output_separator' => '',
);
my $ret = "['1','2',],";
ok($obj->indent([1, 2]), $ret);
