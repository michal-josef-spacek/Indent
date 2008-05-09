# $Id: 07_indent.t,v 1.2 2008-05-09 13:55:53 skim Exp $

print "Testing: Indent test.\n" if $debug;
my $obj = $class->new(
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
ok($obj->indent({1 => 2, 3 => ['a', \'b']}), $ret);