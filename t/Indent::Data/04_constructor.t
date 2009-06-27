# Modules.
use Indent::Data;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::Data->new;
ok(defined $obj);
ok($obj->isa('Indent::Data'));

print "Testing: new('') bad constructor.\n";
eval {
	$obj = Indent::Data->new('');
};
is($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Indent::Data->new('something' => 'value');
};
is($@, "Unknown parameter 'something'.\n");
