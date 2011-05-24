# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

my $obj = Indent::PerlStruct->new;
my $struct = {
	'newline' => "\n",
	'tab' => "\t",
};
my $ret = $obj->indent($struct);
my $right_ret = <<"END";
{
	'newline' => '\n',
	'tab' => '\t',
},
END
is($ret, $right_ret);
