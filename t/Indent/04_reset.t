# $Id: 04_reset.t,v 1.1 2005-02-14 03:50:52 skim Exp $

print "Testing: Reseting of indent.\n" if $debug;
$obj = new $class();
ok($obj->get(), '');
$obj->add('---');
ok($obj->get(), '---');
$obj->add('hoho');
ok($obj->get(), '---hoho');
$obj->reset('|||');
ok($obj->get(), "|||");
$obj->add('---');
ok($obj->get(), "|||---");
$obj->remove('---');
ok($obj->get(), "|||");
$obj->reset();
ok($obj->get(), '');
