# $Id: 03_indent.t,v 1.1 2005-02-14 03:50:52 skim Exp $

print "Testing: Indenting.\n" if $debug;
$obj = new $class();
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
