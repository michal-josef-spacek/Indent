# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Form;
use Test::More 'tests' => 4;

eval {
	Indent::Form->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	Indent::Form->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

my $obj = Indent::Form->new;
ok(defined $obj);
ok($obj->isa('Indent::Form'));
