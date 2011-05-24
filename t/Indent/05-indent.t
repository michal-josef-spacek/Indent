# Pragmas.
use strict;
use warnings;

# Modules.
use Indent;
use Test::More 'tests' => 12;

# Test.
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

# Test.
$obj = Indent->new(
	'next_indent' => '--',
);
is($obj->get, '');
$obj->add;
is($obj->get, '--');
$obj->add;
is($obj->get, '----');
$obj->remove;
is($obj->get, '--');
$obj->remove;
is($obj->get, '');
