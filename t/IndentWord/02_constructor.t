# $Id: 02_constructor.t,v 1.4 2005-07-19 10:30:05 skim Exp $

print "Testing: new() plain constructor.\n" if $debug;
my $obj = $class->new();
ok(defined $obj, 1);
ok($obj->isa($class), 1);
ok($obj, qr/$class/);

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
