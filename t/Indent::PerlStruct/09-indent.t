# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::PerlStruct;
use Test::More 'tests' => 2;

my $obj = Indent::PerlStruct->new(
	'next_indent' => '  ',
);
my $ret = <<'END';
{
  '1' => 2,
  '3' => [
    'a',
    \'b',
  ],
},
END
is($obj->indent({1 => 2, 3 => ['a', \'b']}), $ret);

eval {
	$obj->indent({1 => \*STDOUT});
};
is($EVAL_ERROR, "Unsupported data.\n");
