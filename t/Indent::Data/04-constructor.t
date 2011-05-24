# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Data;
use Test::More 'tests' => 4;

print "Testing: new('') bad constructor.\n";
eval {
	Indent::Data->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::Data->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

print "Testing: new() right constructor.\n";
my $obj = Indent::Data->new;
ok(defined $obj);
ok($obj->isa('Indent::Data'));
