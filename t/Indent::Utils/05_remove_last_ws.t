# Modules.
use Indent::Utils qw(remove_last_ws);;
use Test::More 'tests' => 3;

print "Testing: remove_last_ws() function.\n";
my $string = 'string   ';
remove_last_ws(\$string);
is($string, 'string');

$string = "string \t \t";
remove_last_ws(\$string);
is($string, 'string');

$string = "  string \t \t";
remove_last_ws(\$string);
is($string, '  string');
