# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Utils qw(reduce_duplicit_ws);
use Test::More 'tests' => 3;

# Test.
my $string = 's   tring';
reduce_duplicit_ws(\$string);
is($string, 's tring');

# Test.
$string = "s \t\n  tring";
reduce_duplicit_ws(\$string);
is($string, 's tring');

# Test.
$string = "s \t\n  t \t\n\ ring";
reduce_duplicit_ws(\$string);
is($string, 's t ring');
