# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent;
use Test::More 'tests' => 9;

eval {
	Indent->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

eval {
	Indent->new(
		'next_indent' => undef,
	);
};
is($EVAL_ERROR, "'next_indent' parameter must be defined.\n");

eval {
	Indent->new(
		'next_indent' => {},
	);
};
is($EVAL_ERROR, "'next_indent' parameter must be a string.\n");

eval {
	Indent->new(
		'next_indent' => \'',
	);
};
is($EVAL_ERROR, "'next_indent' parameter must be a string.\n");

eval {
	Indent->new(
		'indent' => undef,
	);
};
is($EVAL_ERROR, "'indent' parameter must be defined.\n");

eval {
	Indent->new(
		'indent' => {},
	);
};
is($EVAL_ERROR, "'indent' parameter must be a string.\n");

eval {
	Indent->new(
		'indent' => \'',
	);
};
is($EVAL_ERROR, "'indent' parameter must be a string.\n");

my $obj = Indent->new;
isa_ok($obj, 'Indent');
