# $Id: 04_bad_indent.t,v 1.1 2005-05-14 02:48:14 skim Exp $

print "Testing: Bad indent. Not a ref to array.\n" if $debug;
$obj = $class->new(
	'begin' => '{',
	'end' => '}'
);
my @data = ();
eval {
	$obj->indent(@data);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, $class.': Cannot define data.');

print "Testing: Bad indent. Array is empty.\n" if $debug;
$obj = $class->new(
	'begin' => '{',
	'end' => '}'
);
eval {
	$obj->indent(\@data);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, $class.': Cannot define data.');
