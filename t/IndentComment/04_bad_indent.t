# $Id: 04_bad_indent.t,v 1.4 2005-12-13 23:04:37 skim Exp $

print "Testing: Bad indent. Not a ref to array.\n" if $debug;
my $obj = $class->new(
	'begin' => '{',
	'end' => '}'
);
my @data = ();
eval {
	$obj->indent(@data);
};
ok($@, "Cannot define data.\n");

print "Testing: Bad indent. Array is empty.\n" if $debug;
$obj = $class->new(
	'begin' => '{',
	'end' => '}'
);
eval {
	$obj->indent(\@data);
};
ok($@, "Cannot define data.\n");
