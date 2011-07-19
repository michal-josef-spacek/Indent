# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Utils qw(remove_first_ws);
use Test::More 'tests' => 3;

# Test.
my $string = '   string';
remove_first_ws(\$string);
is($string, 'string');

# Test.
$string = "\t \t string";
remove_first_ws(\$string);
is($string, 'string');

# Test.
$string = "\t \t string  ";
remove_first_ws(\$string);
is($string, 'string  ');
