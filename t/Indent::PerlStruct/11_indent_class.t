# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

print "Testing: Class dump.\n";
my $obj = Indent::PerlStruct->new;
my $ret = <<"END";
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
my $class = Indent::PerlStruct->new;
is($obj->indent({1 => $class}), $ret);
