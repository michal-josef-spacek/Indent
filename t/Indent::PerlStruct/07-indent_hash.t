# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 3;

my $obj = Indent::PerlStruct->new;
my $ret = <<'END';
{
	'1' => 2,
	'3' => 4,
},
END
is($obj->indent({1 => 2, 3 => 4}), $ret);

$ret = <<'END';
{},
END
is($obj->indent({}), $ret);

$ret = <<'END';
{
	'1' => undef,
	'2' => undef,
},
END
is($obj->indent({1 => undef, 2 => undef}), $ret);
