# $Id: 02_constructor.t,v 1.1 2005-04-10 18:59:09 skim Exp $

print "Testing: new() plain constructor.\n" if $debug;
$obj = new $class();
ok(defined $obj, 1);
ok($obj->isa($class), 1);
ok($obj, qr/$class/);

print "Testing: new() bad constructor.\n" if $debug;
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
