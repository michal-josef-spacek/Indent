# $Id: 02_constructor.t,v 1.3 2005-05-14 02:48:13 skim Exp $

print "Testing: new('') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('');
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Created with odd number of parameters - should be of ".
	"the form option => value.");

print "Testing: new('something' => 'value') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('something' => 'value');
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Bad parameter 'something'.");

print "Testing: new() bad constructor.\n" if $debug;
eval {
	$obj = $class->new();
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Cannot define comments.");
