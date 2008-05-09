# $Id: 05_indent_hash.t,v 1.1 2008-05-09 14:21:22 skim Exp $

print "Testing: Hash dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
{
	'1' => '2',
	'3' => '4',
},
END
ok($obj->indent({1 => 2, 3 => 4}), $ret);
