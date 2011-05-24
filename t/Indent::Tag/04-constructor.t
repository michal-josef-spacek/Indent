# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Tag;
use Test::More 'tests' => 3;

# Test.
eval {
	Indent::Tag->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

# Test.
eval {
	Indent::Tag->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

# Test.
my $obj = Indent::Tag->new;
isa_ok($obj, 'Indent::Tag');
