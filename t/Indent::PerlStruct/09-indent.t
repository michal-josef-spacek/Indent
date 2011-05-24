# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::PerlStruct;
use Test::More 'tests' => 2;

print "Testing: Indent test.\n";
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

print "Testing: Indent bad data.\n";
eval {
	$obj->indent({1 => \*STDOUT});
};
is($EVAL_ERROR, "Unsupported data.\n");
