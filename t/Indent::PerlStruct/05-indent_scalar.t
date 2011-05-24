# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 3;

# Test.
my $obj = Indent::PerlStruct->new;
is($obj->indent('xxx'), "'xxx'\n");
is($obj->indent(\'xxx'), "\\'xxx'\n");
my $scalar = undef;
is($obj->indent($scalar), "undef\n");
