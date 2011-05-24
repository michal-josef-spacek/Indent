# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

print "Testing: Class dump.\n";
my $obj = Indent::PerlStruct->new;
my $class = Indent::PerlStruct->new;
my $ret = $obj->indent({
	1 => $class,
});
my $right_ret = <<"END";
{
	'1' => {
		'indent' => {
			'indent' => '',
			'next_indent' => '\t',
		},
		'next_indent' => '\t',
		'output_separator' => '\n',
	},
},
END
is($ret, $right_ret);
