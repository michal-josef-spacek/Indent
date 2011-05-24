# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

# Test.
my $obj = Indent::PerlStruct->new;
my $ret = <<'END';
{
	'1' => 2,
	'3' => [
		'a',
		\'b',
	],
	'4' => undef,
},
END
is($obj->indent({1 => 2, 3 => ['a', \'b'], 4 => undef}), $ret);
