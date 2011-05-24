# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Data;
use Test::More 'tests' => 5;

# Test.
eval {
	Indent::Data->new(
		'next_indent' => '  ',
		'line_size' => 0,
	);
};
is($EVAL_ERROR, "'line_size' parameter must be a number.\n");

# Test.
eval {
	Indent::Data->new(
		'next_indent' => '  ',
		'line_size' => 'ko',
	);
};
is($EVAL_ERROR, "'line_size' parameter must be a number.\n");

# Test.
eval {
	Indent::Data->new(
		'next_indent' => '  ',
		'line_size' => '1',
	);
};
is($EVAL_ERROR, "Bad line_size = '1' or length of string '  '.\n");

# Test.
my $obj = Indent::Data->new(
	'next_indent' => '',
	'line_size' => 5,
);
eval {
	$obj->indent('text', '<--->');
};
is($EVAL_ERROR, "Bad actual indent value. Length is greater then ".
	"('line_size' - 'size of next_indent' - 1).\n");

# Test.
$obj = Indent::Data->new(
	'next_indent' => ' ',
	'line_size' => 5,
);
eval {
	$obj->indent('text', '<-->');
};
is($EVAL_ERROR, "Bad actual indent value. Length is greater then ".
	"('line_size' - 'size of next_indent' - 1).\n");
