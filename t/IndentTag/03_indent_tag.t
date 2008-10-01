print "Testing: No-indenting tag.\n" if $debug;
my $obj = $class->new(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $set_no_indent = 1;
my $act_indent = '---';
my $tag = '<tag param="value" param2="value2" param3="val3">';
my $ret = $obj->indent($tag, $act_indent, $set_no_indent);
ok(length $ret, length($tag) + 3);

print "Testing: Indenting tag.\n" if $debug;
$set_no_indent = 0;
my @ret = $obj->indent($tag, $act_indent, $set_no_indent);
ok($#ret, 3);
ok($ret[0], '---<tag param=');
ok(length $ret[0] <= 20);
ok($ret[1], '---  "value" param2=');
ok(length $ret[1] <= 20);
ok($ret[2], '---  "value2" param3');
ok(length $ret[2] <= 20);
ok($ret[3], '---  ="val3">');
ok(length $ret[3] <= 20);

print "Testing: Indenting tag, but one is non-indented.\n" if $debug;
$tag = '<tag param="value" param2="value2" param3="valuevaluevalue3">';
@ret = $obj->indent($tag, $act_indent, $set_no_indent);
ok($#ret, 5);
ok(length $ret[0] <= 20);
ok(length $ret[1] <= 20);
ok(length $ret[2] <= 20);
ok(length $ret[3] <= 20);
ok(length $ret[4] > 20);
ok(length $ret[5] <= 20);
ok($ret[4], '---  "valuevaluevalue3"');

print "Testing: Indenting tag with long attribute.\n" if $debug;
$obj = $class->new(
	'next_indent' => '',
	'line_size' => 5,
);
$tag = '<tag param="val val val val val val val val val">';
@ret = $obj->indent($tag);
ok($ret[0], '<tag');
ok($ret[1], 'param');
ok($ret[2], '=');
ok($ret[3], '"val val val val val val val val val"');
ok($ret[4], '>');

