# $Id: 03_indent_word.t,v 1.4 2005-04-10 20:00:52 skim Exp $

print "Testing: No-indenting data.\n" if $debug;
$obj = new $class(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $set_no_indent = 1;
my $act_indent = '---';
my $data = 'a b c d e f g h i j k l m n o p q r s t u v w x y z' x 2;
my $ret = $obj->indent($data, $act_indent, $set_no_indent);
ok(length($ret) > 20, 1);

print "Testing: Indenting data.\n" if $debug;
$set_no_indent = 0;
my @ret = $obj->indent($data, $act_indent, $set_no_indent);
my $log = 0;
foreach (@ret) {
	if (length($_) > 20) {
		$log = 1;
	}
}
ok($log, 0);

print "Testing: Indenting data, but data is non-indented.\n" if $debug;
$data = 'abcdefghijklmnopqrstuvwxyz' x 3;
@ret = $obj->indent($data, $act_indent, $set_no_indent);
ok($#ret, 0);
ok($ret[0], '---abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdef'.
	'ghijklmnopqrstuvwxyz');
