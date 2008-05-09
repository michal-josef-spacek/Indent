# $Id: 06_indent_all.t,v 1.1 2008-05-09 14:21:22 skim Exp $

print "Testing: Structure dump.\n" if $debug;
my $obj = $class->new;
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
