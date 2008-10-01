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
