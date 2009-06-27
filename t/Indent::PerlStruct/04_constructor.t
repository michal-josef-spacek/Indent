# Modules.
use English qw(-no_match_vars);
use Indent::PerlStruct;
use Test::More 'tests' => 4;

print "Testing: new('') bad constructor.\n";
eval {
	Indent::PerlStruct->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	Indent::PerlStruct->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

print "Testing: new() right constructor.\n";
my $obj = Indent::PerlStruct->new;
ok(defined $obj);
ok($obj->isa('Indent::PerlStruct'));
