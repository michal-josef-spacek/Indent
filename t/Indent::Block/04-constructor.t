# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Block;
use Test::More 'tests' => 4;

eval {
	Indent::Block->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent::Block->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

eval {
	Indent::Block->new(
		'line_size' => 'bad',
	);
};
is($EVAL_ERROR, "'line_size' parameter must be a number.\n");

my $obj = Indent::Block->new;
isa_ok($obj, 'Indent::Block');
