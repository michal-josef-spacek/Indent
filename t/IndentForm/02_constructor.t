# $Id: 02_constructor.t,v 1.7 2005-12-13 23:04:39 skim Exp $

print "Testing: new() plain constructor.\n" if $debug;
my $obj = $class->new;
ok(defined $obj, 1);
ok($obj->isa($class), 1);
ok($obj, qr/$class/);

print "Testing: new('') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('');
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n" if $debug;
eval {
	$obj = $class->new('something' => 'value');
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "Unknown parameter 'something'.\n");
