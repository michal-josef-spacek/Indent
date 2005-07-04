# $Id: 05_string_len.t,v 1.1 2005-07-04 13:48:07 skim Exp $

print "Testing: string_len() function.\n" if $debug;
my $string = '   example';
my $ret = eval $class.'::string_len($string)';
ok($ret, length $string);
ok($string, '   example');

$string = "\texample";
$ret = eval $class.'::string_len($string)';
ok($ret, 15);
ok($string, "\texample");

$string = "\t\texample";
$ret = eval $class.'::string_len($string)';
ok($ret, 23);
ok($string, "\t\texample");
${$class.'::tab_length'} = 2;
$ret = eval $class.'::string_len($string)';
ok($ret, 11);
ok($string, "\t\texample");

$string = "\t example";
$ret = eval $class.'::string_len($string)';
ok($ret, 10);
ok($string, "\t example");
