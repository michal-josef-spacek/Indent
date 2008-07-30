# $Id: 03_indent_scalar.t,v 1.3 2008-07-30 15:38:19 skim Exp $

print "Testing: Scalar dump.\n" if $debug;
my $obj = $class->new;
ok($obj->indent('xxx'), "'xxx'\n");
ok($obj->indent(\'xxx'), "\\'xxx'\n");
my $scalar = undef;
ok($obj->indent($scalar), "undef\n");
