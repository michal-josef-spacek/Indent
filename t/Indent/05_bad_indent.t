print "Testing: Bad indent.\n" if $debug;
my $obj = $class->new;
ok($obj->get, '');
$obj->add('---');
ok($obj->get, '---');
eval {
	$obj->remove('aa');
};
ok($@, "Cannot remove indent 'aa'.\n");
