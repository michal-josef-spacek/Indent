# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Tag;
use Test::More 'tests' => 3;

eval {
	Indent::Tag->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent::Tag->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

my $obj = Indent::Tag->new;
isa_ok($obj, 'Indent::Tag');
