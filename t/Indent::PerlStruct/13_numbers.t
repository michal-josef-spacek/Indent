# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

print "Testing: Numbers.\n";
my $obj = Indent::PerlStruct->new;
my $struct = {
	'five' => '5',
	'other_five' => 5,
	'zero_five' => '05',
	'other_zero_five' => 05,
	
};
my $ret = $obj->indent($struct);
my $right_ret = <<"END";
{
	'five' => 5,
	'other_five' => 5,
	'other_zero_five' => 5,
	'zero_five' => '05',
},
END
is($ret, $right_ret);
