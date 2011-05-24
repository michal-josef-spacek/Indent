# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Tag;
use Test::More 'tests' => 4;

# Test.
my $obj = Indent::Tag->new(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $set_no_indent = 1;
my $act_indent = '---';
my $tag = '<tag param="value" param2="value2" param3="val3">';
my $ret = $obj->indent($tag, $act_indent, $set_no_indent);
is(length $ret, length($tag) + 3);

# Test.
$set_no_indent = 0;
my @right_ret = (
	'---<tag param=',
	'---  "value" param2=',
	'---  "value2" param3',
	'---  ="val3">',
);
my @ret = $obj->indent($tag, $act_indent, $set_no_indent);
is_deeply(\@ret, \@right_ret);

# Test.
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

# Test.
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
