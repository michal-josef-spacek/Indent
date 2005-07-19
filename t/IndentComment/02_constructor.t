# $Id: 02_constructor.t,v 1.4 2005-07-19 10:30:01 skim Exp $

print "Testing: new('') bad constructor.\n" if $debug;
my $obj;
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
