# $Id: 03_indent_data.t,v 1.11 2008-04-21 00:06:12 skim Exp $

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
