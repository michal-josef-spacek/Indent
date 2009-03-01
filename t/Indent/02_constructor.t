# Modules.
use Indent;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent->new;
ok(defined $obj);
ok($obj->isa('Indent'));

print "Testing: new('') bad constructor.\n";
eval {
	$obj = Indent->new('');
};
is($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Indent->new('something' => 'value');
};
is($@, "Unknown parameter 'something'.\n");
