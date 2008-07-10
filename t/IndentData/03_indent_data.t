# $Id: 03_indent_data.t,v 1.13 2008-07-10 00:32:10 skim Exp $

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

@ret = $obj->indent($data);
$log = 0;
foreach (@ret) {
	if (length $_ > 20) {
		$log = 1;
	}
}
ok($log, 0);
ok($#ret, 5);

$ret = $obj->indent($data);
ok(length $ret, 117);

$data = 'text text text texttexttex';
$obj = $class->new(
	'next_indent' => '  ',
	'line_size' => '10',
);
@ret = $obj->indent($data);
ok($ret[0], 'text text ');
ok($ret[1], '  text tex');
ok($ret[2], '  ttexttex');
ok($#ret, 2);

print "Testing: Indenting data with actual indent.\n" if $debug;
$data = 'text';
$obj = $class->new(
	'next_indent' => '',
	'line_size' => '5',
);
@ret = $obj->indent($data, '<-->');
ok($#ret, 3);
ok($ret[0], '<-->t');
ok($ret[1], '<-->e');
ok($ret[2], '<-->x');
ok($ret[3], '<-->t');

$data = 'text';
$obj = $class->new(
	'next_indent' => ' ',
	'line_size' => '5',
);
@ret = $obj->indent($data, '<->');
ok($#ret, 2);
ok($ret[0], '<->te');
ok($ret[1], '<-> x');
ok($ret[2], '<-> t');
