# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

print "Testing: Indent test.\n";
my $obj = Indent::PerlStruct->new(
	'next_indent' => '  ',
);
my $ret = <<'END';
{
  '1' => '2',
  '3' => [
    'a',
    \'b',
  ],
},
END
is($obj->indent({1 => 2, 3 => ['a', \'b']}), $ret);
