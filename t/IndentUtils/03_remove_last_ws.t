# $Id: 03_remove_last_ws.t,v 1.1 2005-07-04 13:48:07 skim Exp $

print "Testing: remove_last() function.\n" if $debug;
my $string = 'string   ';
eval $class.'::remove_last(\$string)';
ok($string, 'string');

$string = "string \t \t";
eval $class.'::remove_last(\$string)';
ok($string, 'string');

$string = "  string \t \t";
eval $class.'::remove_last(\$string)';
ok($string, '  string');
