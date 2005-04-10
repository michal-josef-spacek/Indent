# $Id: 02_constructor.t,v 1.2 2005-04-10 20:29:11 skim Exp $

print "Testing: new('') bad constructor.\n" if $debug;
eval {
	$obj = new $class('');
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Created with odd number of parameters - should be of ".
	"the form option => value.");

print "Testing: new('something' => 'value') bad constructor.\n" if $debug;
eval {
	$obj = new $class('something' => 'value');
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Bad parameter 'something'.");
