# Modules.
use English qw(-no_match_vars);
use Indent::Comment;
use Test::More 'tests' => 5;

print "Testing: new('') bad constructor.\n";
my $obj;
eval {
	Indent::Comment->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::Comment->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

print "Testing: new() bad constructor.\n";
eval {
	Indent::Comment->new;
};
is($EVAL_ERROR, "Cannot define comments.\n");

print "Testing: new('middle' => ' * ') right constructor.\n";
my $obj = Indent::Comment->new(
	'middle' => ' * ',
);
ok(defined $obj);
ok($obj->isa('Indent::Comment'));
