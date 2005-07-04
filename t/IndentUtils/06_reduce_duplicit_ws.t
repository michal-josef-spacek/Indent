# $Id: 06_reduce_duplicit_ws.t,v 1.1 2005-07-04 13:57:13 skim Exp $

print "Testing: remove_duplicit_ws() function.\n" if $debug;
my $string = 's   tring';
eval $class.'::remove_duplicit_ws(\$string)';
ok($string, 's tring');

