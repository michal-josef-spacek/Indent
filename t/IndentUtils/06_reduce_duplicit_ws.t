# $Id: 06_reduce_duplicit_ws.t,v 1.2 2005-07-04 14:00:13 skim Exp $

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
