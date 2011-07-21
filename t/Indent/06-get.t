# Pragmas.
use strict;
use warnings;

# Modules.
use Indent;
use Test::More 'tests' => 2;

# Test.
my $obj = Indent->new;
is($obj->get, '', 'Get value without indent.');
$obj->add('---');
is($obj->get, '---', 'Get value with indent.');
