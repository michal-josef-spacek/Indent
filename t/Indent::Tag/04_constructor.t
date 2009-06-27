# Modules.
use English qw(-no_match_vars);
use Indent::Tag;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::Tag->new;
ok(defined $obj);
ok($obj->isa('Indent::Tag'));

print "Testing: new('') bad constructor.\n";
eval {
	Indent::Tag->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::Tag->new('something' => 'value');
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");
