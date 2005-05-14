# $Id: 03_indent_comment.t,v 1.2 2005-05-14 02:48:13 skim Exp $

print "Testing: Comment indent.\n" if $debug;
my $middle = '  ';
$obj = $class->new(
	'begin' => '{',
	'middle' => $middle,
	'end' => '}'
);
my @data = ('one', 'two');
my $ret = $obj->indent(\@data);
ok($ret, "{\n".$middle."one\n".$middle."two\n}");
