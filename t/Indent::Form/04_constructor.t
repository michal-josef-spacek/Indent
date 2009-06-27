# Modules.
use English qw(-no_match_vars);
use Indent::Form;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::Form->new;
ok(defined $obj);
ok($obj->isa('Indent::Form'));

print "Testing: new('') bad constructor.\n";
eval {
	Indent::Form->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::Form->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");
