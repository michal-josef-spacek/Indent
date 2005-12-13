# $Id: 05_bad_indent.t,v 1.2 2005-12-13 23:04:36 skim Exp $

print "Testing: Bad indent.\n" if $debug;
my $obj = $class->new;
ok($obj->get, '');
$obj->add('---');
ok($obj->get, '---');
eval {
	$obj->remove('aa');
};
ok($@, "Cannot remove indent 'aa'.\n");
