# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Comment;
use Test::More 'tests' => 4;

# Test.
eval {
	Indent::Comment->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

# Test.
eval {
	Indent::Comment->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

# Test.
eval {
	Indent::Comment->new;
};
is($EVAL_ERROR, "Cannot define comments.\n");

# Test.
my $obj = Indent::Comment->new(
	'middle' => ' * ',
);
isa_ok($obj, 'Indent::Comment');
