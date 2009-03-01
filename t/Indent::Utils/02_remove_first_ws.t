# Modules.
use Indent::Utils qw(remove_first_ws);
use Test::More 'tests' => 3;

print "Testing: remove_first_ws() function.\n";
my $string = '   string';
remove_first_ws(\$string);
is($string, 'string');

$string = "\t \t string";
remove_first_ws(\$string);
is($string, 'string');

$string = "\t \t string  ";
remove_first_ws(\$string);
is($string, 'string  ');