# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Utils qw(string_len);
use Test::More 'tests' => 10;

print "Testing: string_len() function.\n";
my $string = '   example';
my $ret = string_len($string);
is($ret, length $string);
is($string, '   example');

$string = "\texample";
$ret = string_len($string);
is($ret, 15);
is($string, "\texample");

$string = "\t\texample";
$ret = string_len($string);
is($ret, 23);
is($string, "\t\texample");
$Indent::Utils::TAB_LENGTH = 2;
$ret = string_len($string);
is($ret, 11);
is($string, "\t\texample");

$string = "\t example";
$ret = string_len($string);
is($ret, 10);
is($string, "\t example");
