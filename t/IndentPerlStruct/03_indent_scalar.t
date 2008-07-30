# $Id: 03_indent_scalar.t,v 1.2 2008-07-30 14:52:38 skim Exp $

print "Testing: Scalar dump.\n" if $debug;
my $obj = $class->new;
ok($obj->indent('xxx'), "'xxx'\n");
ok($obj->indent(\'xxx'), "\\'xxx'\n");
my $scalar = undef;
ok($obj->indent($scalar), "undef\n");

print "Testing: \$comma_flag in indent method.\n" if $debug;
ok($obj->indent('xxx', 1), "'xxx',\n");
ok($obj->indent(\'xxx', 1), "\\'xxx',\n");
ok($obj->indent('xxx', 0), "'xxx'\n");
ok($obj->indent(\'xxx', 0), "\\'xxx'\n");
