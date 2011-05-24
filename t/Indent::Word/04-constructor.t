# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Word;
use Test::More 'tests' => 3;

eval {
	Indent::Word->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent::Word->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

my $obj = Indent::Word->new;
isa_ok($obj, 'Indent::Word');
