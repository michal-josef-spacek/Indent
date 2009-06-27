# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::PerlStruct->new;
ok(defined $obj);
ok($obj->isa('Indent::PerlStruct'));

print "Testing: new('') bad constructor.\n";
eval {
	$obj = Indent::PerlStruct->new('');
};
is($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Indent::PerlStruct->new('something' => 'value');
};
is($@, "Unknown parameter 'something'.\n");
