# Modules.
use English qw(-no_match_vars);
use Indent::Form;
use Test::More 'tests' => 1;

print "Testing: Bad ident.\n";
print "-- Bad value in line_size.\n";
eval {
	Indent::Form->new(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
is($EVAL_ERROR, "Bad line_size = 'ko'.\n");
