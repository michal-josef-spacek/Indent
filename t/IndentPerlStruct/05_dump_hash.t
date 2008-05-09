# $Id: 05_dump_hash.t,v 1.1 2008-05-09 13:39:10 skim Exp $

print "Testing: Hash dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
{
	'1' => '2',
	'3' => '4',
},
END
ok($obj->dump({1 => 2, 3 => 4}), $ret);
