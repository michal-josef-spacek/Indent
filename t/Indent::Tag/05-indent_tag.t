# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Tag;
use Test::More 'tests' => 4;

print "Testing: No-indenting tag.\n";
my $obj = Indent::Tag->new(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $set_no_indent = 1;
my $act_indent = '---';
my $tag = '<tag param="value" param2="value2" param3="val3">';
my $ret = $obj->indent($tag, $act_indent, $set_no_indent);
is(length $ret, length($tag) + 3);

print "Testing: Indenting tag.\n";
$set_no_indent = 0;
my @right_ret = (
	'---<tag param=',
	'---  "value" param2=',
	'---  "value2" param3',
	'---  ="val3">',
);
my @ret = $obj->indent($tag, $act_indent, $set_no_indent);
is_deeply(\@ret, \@right_ret);

print "Testing: Indenting tag, but one is non-indented.\n";
$tag = '<tag param="value" param2="value2" param3="valuevaluevalue3">';
@right_ret = (
	'---<tag param=',
	'---  "value" param2=',
	'---  "value2" param3',
	'---  =',
	'---  "valuevaluevalue3"',
	'---  >'
);
@ret = $obj->indent($tag, $act_indent, $set_no_indent);
is_deeply(\@ret, \@right_ret);

print "Testing: Indenting tag with long attribute.\n";
$obj = Indent::Tag->new(
	'next_indent' => '',
	'line_size' => 5,
);
$tag = '<tag param="val val val val val val val val val">';
@right_ret = (
	'<tag',
	'param',
	'=',
	'"val val val val val val val val val"',
	'>',
);
@ret = $obj->indent($tag);
is_deeply(\@ret, \@right_ret);
