# Modules.
use Indent;
use Test::More 'tests' => 3;

print "Testing: Bad indent.\n";
my $obj = Indent->new;
is($obj->get, '');
$obj->add('---');
is($obj->get, '---');
eval {
	$obj->remove('aa');
};
is($@, "Cannot remove indent 'aa'.\n");
