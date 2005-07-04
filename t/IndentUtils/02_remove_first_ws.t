# $Id: 02_remove_first_ws.t,v 1.2 2005-07-04 13:57:13 skim Exp $

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
