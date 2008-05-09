# $Id: 03_dump_scalar.t,v 1.3 2008-05-09 14:18:38 skim Exp $

print "Testing: Scalar dump.\n" if $debug;
my $obj = $class->new;
ok($obj->indent('xxx'), "'xxx'\n");
ok($obj->indent(\'xxx'), "\\'xxx'\n");

print "Testing: \$comma_flag in indent method.\n" if $debug;
ok($obj->indent('xxx', 1), "'xxx',\n");
ok($obj->indent(\'xxx', 1), "\\'xxx',\n");
ok($obj->indent('xxx', 0), "'xxx'\n");
ok($obj->indent(\'xxx', 0), "\\'xxx'\n");
