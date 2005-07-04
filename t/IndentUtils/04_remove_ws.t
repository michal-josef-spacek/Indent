# $Id: 04_remove_ws.t,v 1.1 2005-07-04 13:48:07 skim Exp $

print "Testing: remove() function.\n" if $debug;
my $string = 'string   ';
eval $class.'::remove(\$string)';
ok($string, 'string');

$string = "string \t \t";
eval $class.'::remove(\$string)';
ok($string, 'string');

$string = '   string';
eval $class.'::remove(\$string)';
ok($string, 'string');

$string = "\t \t string";
eval $class.'::remove(\$string)';
ok($string, 'string');

$string = "  string \t \t";
eval $class.'::remove(\$string)';
ok($string, 'string');

$string = " \t \t string \t \t";
eval $class.'::remove(\$string)';
ok($string, 'string');

