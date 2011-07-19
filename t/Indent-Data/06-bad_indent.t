# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Data;
use Test::More 'tests' => 2;

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
