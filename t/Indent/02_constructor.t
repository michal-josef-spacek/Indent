# Modules.
use Indent;
use Test::More 'tests' => 10;

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

print "Testing: new('next_indent' => undef) bad constructor.\n";
eval {
	$obj = Indent->new('next_indent' => undef);
};
is($@, "'next_indent' parameter must be defined.\n");

print "Testing: new('next_indent' => {}) bad constructor.\n";
eval {
	$obj = Indent->new('next_indent' => {});
};
is($@, "'next_indent' parameter must be a string.\n");

print "Testing: new('next_indent' => \\'') bad constructor.\n";
eval {
	$obj = Indent->new('next_indent' => \'');
};
is($@, "'next_indent' parameter must be a string.\n");

print "Testing: new('indent' => undef) bad constructor.\n";
eval {
	$obj = Indent->new('indent' => undef);
};
is($@, "'indent' parameter must be defined.\n");

print "Testing: new('indent' => {}) bad constructor.\n";
eval {
	$obj = Indent->new('indent' => {});
};
is($@, "'indent' parameter must be a string.\n");

print "Testing: new('indent' => \\'') bad constructor.\n";
eval {
	$obj = Indent->new('indent' => \'');
};
is($@, "'indent' parameter must be a string.\n");

