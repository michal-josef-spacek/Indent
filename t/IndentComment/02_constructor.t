# $Id: 02_constructor.t,v 1.6 2005-12-13 23:04:37 skim Exp $

print "Testing: new('') bad constructor.\n" if $debug;
my $obj;
eval {
	$obj = $class->new('');
};
ok($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('something' => 'value');
};
ok($@, "Unknown parameter 'something'.\n");

print "Testing: new() bad constructor.\n" if $debug;
eval {
	$obj = $class->new;
};
ok($@, "Cannot define comments.\n");
