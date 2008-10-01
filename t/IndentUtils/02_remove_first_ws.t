print "Testing: remove_first_ws() function.\n" if $debug;
my $string = '   string';
eval $class.'::remove_first_ws(\$string)';
ok($string, 'string');

$string = "\t \t string";
eval $class.'::remove_first_ws(\$string)';
ok($string, 'string');

$string = "\t \t string  ";
eval $class.'::remove_first_ws(\$string)';
ok($string, 'string  ');
