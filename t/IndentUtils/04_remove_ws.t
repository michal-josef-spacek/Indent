print "Testing: remove_ws() function.\n" if $debug;
my $string = 'string   ';
eval $class.'::remove_ws(\$string)';
ok($string, 'string');

$string = "string \t \t";
eval $class.'::remove_ws(\$string)';
ok($string, 'string');

$string = '   string';
eval $class.'::remove_ws(\$string)';
ok($string, 'string');

$string = "\t \t string";
eval $class.'::remove_ws(\$string)';
ok($string, 'string');

$string = "  string \t \t";
eval $class.'::remove_ws(\$string)';
ok($string, 'string');

$string = " \t \t string \t \t";
eval $class.'::remove_ws(\$string)';
ok($string, 'string');

