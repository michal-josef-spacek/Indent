# $Id: 04_reset.t,v 1.2 2005-05-14 02:48:54 skim Exp $

print "Testing: Reseting of indent.\n" if $debug;
$obj = $class->new();
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
