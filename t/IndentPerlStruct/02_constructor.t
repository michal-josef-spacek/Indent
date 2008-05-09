# $Id: 02_constructor.t,v 1.1 2008-05-09 13:39:10 skim Exp $

print "Testing: new() plain constructor.\n" if $debug;
my $obj = $class->new;
ok(defined $obj, 1);
ok($obj->isa($class), 1);
ok($obj, qr/$class/);

print "Testing: new('') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('');
};
ok($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('something' => 'value');
};
ok($@, "Unknown parameter 'something'.\n");
