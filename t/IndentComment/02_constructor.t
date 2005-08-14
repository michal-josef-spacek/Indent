# $Id: 02_constructor.t,v 1.5 2005-08-14 17:27:30 skim Exp $

print "Testing: new('') bad constructor.\n" if $debug;
my $obj;
eval {
	$obj = $class->new('');
};
ok($@, "$class: Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('something' => 'value');
};
ok($@, "$class: Unknown parameter 'something'.\n");

print "Testing: new() bad constructor.\n" if $debug;
eval {
	$obj = $class->new;
};
ok($@, "$class: Cannot define comments.\n");
