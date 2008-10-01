print "Testing: remove_last_ws() function.\n" if $debug;
my $string = 'string   ';
eval $class.'::remove_last_ws(\$string)';
ok($string, 'string');

$string = "string \t \t";
eval $class.'::remove_last_ws(\$string)';
ok($string, 'string');

$string = "  string \t \t";
eval $class.'::remove_last_ws(\$string)';
ok($string, '  string');
