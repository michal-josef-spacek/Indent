# $Id: 06_indent_all.t,v 1.2 2008-07-30 14:52:38 skim Exp $

print "Testing: Structure dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
{
	'1' => '2',
	'3' => [
		'a',
		\'b',
	],
	'4' => undef,
},
END
ok($obj->indent({1 => 2, 3 => ['a', \'b'], 4 => undef}), $ret);
