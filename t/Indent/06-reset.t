# Modules.
use Indent;
use Test::More 'tests' => 7;

print "Testing: Reseting of indent.\n";
my $obj = Indent->new;
is($obj->get, '');
$obj->add('---');
is($obj->get, '---');
$obj->add('hoho');
is($obj->get, '---hoho');
$obj->reset('|||');
is($obj->get, "|||");
$obj->add('---');
is($obj->get, "|||---");
$obj->remove('---');
is($obj->get, "|||");
$obj->reset;
is($obj->get, '');
