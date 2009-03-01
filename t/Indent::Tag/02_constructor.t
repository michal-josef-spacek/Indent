# Modules.
use Indent::Tag;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::Tag->new;
ok(defined $obj);
ok($obj->isa('Indent::Tag'));

print "Testing: new('') bad constructor.\n";
eval {
	$obj = Indent::Tag->new('');
};
is($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Indent::Tag->new('something' => 'value');
};
is($@, "Unknown parameter 'something'.\n");
