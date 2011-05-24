# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::PerlStruct;
use Test::More 'tests' => 4;

eval {
	Indent::PerlStruct->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent::PerlStruct->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

my $obj = Indent::PerlStruct->new;
ok(defined $obj);
ok($obj->isa('Indent::PerlStruct'));
