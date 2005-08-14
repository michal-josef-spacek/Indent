# $Id: 04_bad_indent.t,v 1.3 2005-08-14 17:27:30 skim Exp $

print "Testing: Bad indent. Not a ref to array.\n" if $debug;
my $obj = $class->new(
	'begin' => '{',
	'end' => '}'
);
my @data = ();
eval {
	$obj->indent(@data);
};
ok($@, "$class: Cannot define data.\n");

print "Testing: Bad indent. Array is empty.\n" if $debug;
$obj = $class->new(
	'begin' => '{',
	'end' => '}'
);
eval {
	$obj->indent(\@data);
};
ok($@, "$class: Cannot define data.\n");
