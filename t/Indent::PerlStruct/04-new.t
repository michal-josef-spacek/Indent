# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::PerlStruct;
use Test::More 'tests' => 3;

# Test.
eval {
	Indent::PerlStruct->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

# Test.
eval {
	Indent::PerlStruct->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

# Test.
my $obj = Indent::PerlStruct->new;
isa_ok($obj, 'Indent::PerlStruct');
