# $Id: 04_reset.t,v 1.4 2005-08-14 16:27:53 skim Exp $

print "Testing: Reseting of indent.\n" if $debug;
my $obj = $class->new;
ok($obj->get, '');
$obj->add('---');
ok($obj->get, '---');
$obj->add('hoho');
ok($obj->get, '---hoho');
$obj->reset('|||');
ok($obj->get, "|||");
$obj->add('---');
ok($obj->get, "|||---");
$obj->remove('---');
ok($obj->get, "|||");
$obj->reset;
ok($obj->get, '');
