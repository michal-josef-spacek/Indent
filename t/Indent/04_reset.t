# $Id: 04_reset.t,v 1.3 2005-07-19 10:30:00 skim Exp $

print "Testing: Reseting of indent.\n" if $debug;
my $obj = $class->new();
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
