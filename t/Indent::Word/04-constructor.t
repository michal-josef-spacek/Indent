# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Word;
use Test::More 'tests' => 3;

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
my $obj = Indent::Word->new;
isa_ok($obj, 'Indent::Word');
