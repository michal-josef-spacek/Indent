# Modules.
use Indent::Comment;
use Test::More 'tests' => 3;

print "Testing: new('') bad constructor.\n";
my $obj;
eval {
	Indent::Comment->new('');
};
is($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::Comment->new('something' => 'value');
};
is($@, "Unknown parameter 'something'.\n");

print "Testing: new() bad constructor.\n";
eval {
	Indent::Comment->new;
};
is($@, "Cannot define comments.\n");
