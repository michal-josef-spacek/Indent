# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Data;
use Test::More 'tests' => 4;

eval {
	Indent::Data->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent::Data->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

my $obj = Indent::Data->new;
ok(defined $obj);
ok($obj->isa('Indent::Data'));
