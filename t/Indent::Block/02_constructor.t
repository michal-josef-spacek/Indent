# Modules.
use Indent::Block;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::Block->new;
ok(defined $obj);
ok($obj->isa('Indent::Block'));

print "Testing: new('') bad constructor.\n";
eval {
	$obj = Indent::Block->new('');
};
is($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Indent::Block->new('something' => 'value');
};
is($@, "Unknown parameter 'something'.\n");

# TODO Spatne cislo delky radku.
