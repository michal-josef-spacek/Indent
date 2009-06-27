# Modules.
use Indent::Comment;
use Test::More 'tests' => 2;

print "Testing: Bad indent. Not a ref to array.\n";
my $obj = Indent::Comment->new(
	'begin' => '{',
	'end' => '}'
);
my @data = ();
eval {
	$obj->indent(@data);
};
is($@, "Cannot define data.\n");

print "Testing: Bad indent. Array is empty.\n";
$obj = Indent::Comment->new(
	'begin' => '{',
	'end' => '}'
);
eval {
	$obj->indent(\@data);
};
is($@, "Cannot define data.\n");
