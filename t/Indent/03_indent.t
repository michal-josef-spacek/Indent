# $Id: 03_indent.t,v 1.3 2005-07-19 10:30:00 skim Exp $

print "Testing: Indenting.\n" if $debug;
my $obj = $class->new();
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
