# $Id: 03_indent_tag.t,v 1.4 2005-05-14 02:54:23 skim Exp $

print "Testing: No-indenting tag.\n" if $debug;
$obj = $class->new(
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
ok($ret[0], '---<tag');
ok($ret[1], '---  param="value"');
ok($ret[2], '---  param2="value2"');
ok($ret[3], '---  param3="val3">');

print "Testing: Indenting tag, but one is non-indented.\n" if $debug;
$tag = '<tag param="value" param2="value2" param3="value3">';
@ret = $obj->indent($tag, $act_indent, $set_no_indent);
ok($#ret, 3);
ok($ret[3], '---  param3="value3">');
