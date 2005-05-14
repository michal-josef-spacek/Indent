# $Id: 03_indent.t,v 1.2 2005-05-14 02:48:54 skim Exp $

print "Testing: Indenting.\n" if $debug;
$obj = $class->new();
ok($obj->get(), '');
$obj->add('---');
ok($obj->get(), '---');
$obj->add('hoho');
ok($obj->get(), '---hoho');
$obj->add();
ok($obj->get(), "---hoho\t");
$obj->remove();
ok($obj->get(), '---hoho');
$obj->remove('hoho');
ok($obj->get(), '---');
$obj->remove('---');
ok($obj->get(), '');
