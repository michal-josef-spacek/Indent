# Modules.
use Indent::Form;
use Test::More 'tests' => 4;

print "Testing: new() plain constructor.\n";
my $obj = Indent::Form->new;
ok(defined $obj);
ok($obj->isa('Indent::Form'));

print "Testing: new('') bad constructor.\n";
eval {
	$obj = Indent::Form->new('');
};
is($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Indent::Form->new('something' => 'value');
};
is($@, "Unknown parameter 'something'.\n");
