print "Testing: Scalar dump.\n" if $debug;
my $obj = $class->new;
ok($obj->indent('xxx'), "'xxx'\n");
ok($obj->indent(\'xxx'), "\\'xxx'\n");
my $scalar = undef;
ok($obj->indent($scalar), "undef\n");
