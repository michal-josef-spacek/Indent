print "Testing: reduce_duplicit_ws() function.\n" if $debug;
my $string = 's   tring';
eval $class.'::reduce_duplicit_ws(\$string)';
ok($string, 's tring');

$string = "s \t\n  tring";
eval $class.'::reduce_duplicit_ws(\$string)';
ok($string, 's tring');

$string = "s \t\n  t \t\n\ ring";
eval $class.'::reduce_duplicit_ws(\$string)';
ok($string, 's t ring');
