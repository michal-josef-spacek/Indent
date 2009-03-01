# Modules.
use Indent;
use Test::More 'tests' => 7;

print "Testing: Indenting.\n";
my $obj = Indent->new;
is($obj->get, '');
$obj->add('---');
is($obj->get, '---');
$obj->add('hoho');
is($obj->get, '---hoho');
$obj->add;
is($obj->get, "---hoho\t");
$obj->remove;
is($obj->get, '---hoho');
$obj->remove('hoho');
is($obj->get, '---');
$obj->remove('---');
is($obj->get, '');
