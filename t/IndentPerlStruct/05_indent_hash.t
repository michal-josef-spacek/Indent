# $Id: 05_indent_hash.t,v 1.3 2008-07-30 14:52:38 skim Exp $

print "Testing: Hash dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
{
	'1' => '2',
	'3' => '4',
},
END
ok($obj->indent({1 => 2, 3 => 4}), $ret);

$ret = <<'END';
{},
END
ok($obj->indent({}), $ret);

$ret = <<'END';
{
	'1' => undef,
	'2' => undef,
},
END
ok($obj->indent({1 => undef, 2 => undef}), $ret);
