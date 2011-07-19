# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Word;
use Test::More 'tests' => 4;

# Test.
eval {
	Indent::Word->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

# Test.
eval {
	Indent::Word->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

# Test.
eval {
	Indent::Word->new(
		'next_indent' => '  ',
		'line_size' => 'ko',
	);
};
is($EVAL_ERROR, "'line_size' parameter must be a number.\n");

# Test.
my $obj = Indent::Word->new;
isa_ok($obj, 'Indent::Word');
