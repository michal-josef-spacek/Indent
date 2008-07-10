# $Id: 03_indent_comment.t,v 1.6 2008-07-10 08:43:29 skim Exp $

print "Testing: Comment indent.\n" if $debug;
my $obj = $class->new(
	'begin' => '{',
	'middle' => '  ',
	'end' => '}'
);
my @data = ('one', 'two');
my $ret = $obj->indent(\@data);
ok($ret, "{\n  one\n  two\n}");

$obj = $class->new(
	'middle' => '# ',
);
$ret = $obj->indent(\@data);
ok($ret, "# one\n# two");

$obj = $class->new(
	'begin' => '/*',
	'middle' => ' * ',
	'end' => ' */',
);
my @ret = $obj->indent(\@data);
my @right_ret = (
	'/*',
	' * one',
	' * two',
	' */',
);
ok($#ret, 3);
ok($ret[0], $right_ret[0]);
ok($ret[1], $right_ret[1]);
ok($ret[2], $right_ret[2]);
ok($ret[3], $right_ret[3]);

$obj = $class->new(
	'middle' => '-- ',
);
$ret = $obj->indent(\@data);
ok($ret, "-- one\n-- two");

$obj = $class->new(
	'begin' => '/*',
	'end' => ' */',
	'line_size' => 5,
	'middle' => ' * ',
);
@ret = $obj->indent('ab abc abcd');
ok($#ret, 4);
ok($ret[0], '/*');
ok($ret[1], ' * ab');
ok($ret[2], ' * abc');
ok($ret[3], ' * abcd');
ok($ret[4], ' */');

