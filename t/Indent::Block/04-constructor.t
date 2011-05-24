# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Block;
use Test::More 'tests' => 5;

print "Testing: new('') bad constructor.\n";
eval {
	Indent::Block->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::Block->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

print "Testing: new('line_size' => 'bad') bad constructor.\n";
eval {
	Indent::Block->new(
		'line_size' => 'bad',
	);
};
is($EVAL_ERROR, "'line_size' parameter must be a number.\n");

print "Testing: new() right constructor.\n";
my $obj = Indent::Block->new;
ok(defined $obj);
ok($obj->isa('Indent::Block'));
