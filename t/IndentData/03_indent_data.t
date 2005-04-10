# $Id: 03_indent_data.t,v 1.7 2005-04-10 20:38:44 skim Exp $

print "Testing: No-indenting data.\n" if $debug;
$obj = new $class(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $set_no_indent = 1;
my $act_indent = '---';
my $data = 'a b c d e f g h i j k l m n o p q r s t u v w x y z' x 2;
my $ret = $obj->indent($data, $act_indent, $set_no_indent);
ok(length $ret, length $data);

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
