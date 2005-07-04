# $Id: 02_remove_first_ws.t,v 1.1 2005-07-04 13:48:07 skim Exp $

print "Testing: remove_first() function.\n" if $debug;
my $string = '   string';
eval $class.'::remove_first(\$string)';
ok($string, 'string');

$string = "\t \t string";
eval $class.'::remove_first(\$string)';
ok($string, 'string');

$string = "\t \t string  ";
eval $class.'::remove_first(\$string)';
ok($string, 'string  ');
