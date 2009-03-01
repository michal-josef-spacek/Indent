# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 3;

print "Testing: Scalar dump.\n";
my $obj = Indent::PerlStruct->new;
is($obj->indent('xxx'), "'xxx'\n");
is($obj->indent(\'xxx'), "\\'xxx'\n");
my $scalar = undef;
is($obj->indent($scalar), "undef\n");
