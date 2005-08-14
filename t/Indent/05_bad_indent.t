# $Id: 05_bad_indent.t,v 1.1 2005-08-14 16:44:42 skim Exp $

print "Testing: Bad indent.\n" if $debug;
my $obj = $class->new;
ok($obj->get, '');
$obj->add('---');
ok($obj->get, '---');
eval {
	$obj->remove('aa');
};
ok($@, "Indent: Cannot remove indent 'aa'.\n");
