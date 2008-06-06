# $Id: 05_indent_hash.t,v 1.2 2008-06-06 07:51:56 skim Exp $

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
