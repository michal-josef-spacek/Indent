# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Comment;
use Test::More 'tests' => 5;

eval {
	Indent::Comment->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent::Comment->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

eval {
	Indent::Comment->new;
};
is($EVAL_ERROR, "Cannot define comments.\n");

my $obj = Indent::Comment->new(
	'middle' => ' * ',
);
ok(defined $obj);
ok($obj->isa('Indent::Comment'));
