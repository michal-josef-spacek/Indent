print "Testing: No-indenting data.\n" if $debug;
my $obj = $class->new(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $set_no_indent = 1;
my $act_indent = '---';
my $data = 'a b c d e f g h i j k l m n o p q r s t u v w x y z' x 2;
my $ret = $obj->indent($data, $act_indent, $set_no_indent);
ok(length $ret, length($data) + 3);

print "Testing: Indenting data.\n" if $debug;
$set_no_indent = 0;
my @ret = $obj->indent($data, $act_indent, $set_no_indent);
my $log = 0;
foreach (@ret) {
	if (length $_ > 20) {
		$log = 1;
	}
}
ok($#ret, 6);
ok($log, 0);

print "Testing: Indenting data, but data is non-indented.\n" if $debug;
$data = 'abcdefghijklmnopqrstuvwxyz' x 3;
@ret = $obj->indent($data, $act_indent, $set_no_indent);
ok($#ret, 0);
ok($ret[0], '---abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdef'.
	'ghijklmnopqrstuvwxyz');

print "Testing: Indenting data with actual indent.\n" if $debug;
$data = 'text';
$obj = $class->new(
	'next_indent' => '',
	'line_size' => '5',
);
@ret = $obj->indent($data, '<-->');
ok($#ret, 0);
ok($ret[0], '<-->text');

$data = 'text text';
$obj = $class->new(
	'next_indent' => ' ',
	'line_size' => '5',
);
@ret = $obj->indent($data, '<->');
ok($#ret, 1);
ok($ret[0], '<->text');
ok($ret[1], '<-> text');
