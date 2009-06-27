# Modules.
use English qw(-no_match_vars);
use Indent::Word;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::Word->new;
ok(defined $obj);
ok($obj->isa('Indent::Word'));

print "Testing: new('') bad constructor.\n";
eval {
	Indent::Word->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::Word->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");
