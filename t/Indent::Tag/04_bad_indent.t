# Modules.
use Indent::Tag;
use Test::More 'tests' => 1;

print "Testing: Bad ident.\n";
print "-- Bad value in line_size.\n";
my $obj;
eval {
	$obj = Indent::Tag->new(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
is($@, "Bad line_size = 'ko'.\n");
