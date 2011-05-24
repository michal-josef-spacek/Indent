# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Word;
use Test::More 'tests' => 1;

# Test.
eval {
	Indent::Word->new(
		'next_indent' => '  ',
		'line_size' => 'ko',
	);
};
is($EVAL_ERROR, "'line_size' parameter must be a number.\n");
