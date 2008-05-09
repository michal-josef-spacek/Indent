# $Id: 03_dump_scalar.t,v 1.1 2008-05-09 13:39:10 skim Exp $

print "Testing: Scalar dump.\n" if $debug;
my $obj = $class->new;
ok($obj->dump('xxx'), "'xxx'\n");
ok($obj->dump(\'xxx'), "\\'xxx'\n");
