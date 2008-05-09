# $Id: 03_dump_scalar.t,v 1.2 2008-05-09 13:55:53 skim Exp $

print "Testing: Scalar dump.\n" if $debug;
my $obj = $class->new;
ok($obj->indent('xxx'), "'xxx'\n");
ok($obj->indent(\'xxx'), "\\'xxx'\n");
