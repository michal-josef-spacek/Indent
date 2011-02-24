# Modules.
use English qw(-no_match_vars);
use Indent;
use Test::More 'tests' => 10;

print "Testing: new('') bad constructor.\n";
eval {
	Indent->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

print "Testing: new('next_indent' => undef) bad constructor.\n";
eval {
	Indent->new(
		'next_indent' => undef,
	);
};
is($EVAL_ERROR, "'next_indent' parameter must be defined.\n");

print "Testing: new('next_indent' => {}) bad constructor.\n";
eval {
	Indent->new(
		'next_indent' => {},
	);
};
is($EVAL_ERROR, "'next_indent' parameter must be a string.\n");

print "Testing: new('next_indent' => \\'') bad constructor.\n";
eval {
	Indent->new(
		'next_indent' => \'',
	);
};
is($EVAL_ERROR, "'next_indent' parameter must be a string.\n");

print "Testing: new('indent' => undef) bad constructor.\n";
eval {
	Indent->new(
		'indent' => undef,
	);
};
is($EVAL_ERROR, "'indent' parameter must be defined.\n");

print "Testing: new('indent' => {}) bad constructor.\n";
eval {
	Indent->new(
		'indent' => {},
	);
};
is($EVAL_ERROR, "'indent' parameter must be a string.\n");

print "Testing: new('indent' => \\'') bad constructor.\n";
eval {
	Indent->new(
		'indent' => \'',
	);
};
is($EVAL_ERROR, "'indent' parameter must be a string.\n");

print "Testing: new() right constructor.\n";
my $obj = Indent->new;
ok(defined $obj);
ok($obj->isa('Indent'));
