# $Id: 03_indent_scalar.t,v 1.1 2008-05-09 14:21:22 skim Exp $

print "Testing: Scalar dump.\n" if $debug;
my $obj = $class->new;
ok($obj->indent('xxx'), "'xxx'\n");
ok($obj->indent(\'xxx'), "\\'xxx'\n");

print "Testing: \$comma_flag in indent method.\n" if $debug;
ok($obj->indent('xxx', 1), "'xxx',\n");
ok($obj->indent(\'xxx', 1), "\\'xxx',\n");
ok($obj->indent('xxx', 0), "'xxx'\n");
ok($obj->indent(\'xxx', 0), "\\'xxx'\n");
