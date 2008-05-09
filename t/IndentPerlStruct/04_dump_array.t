# $Id: 04_dump_array.t,v 1.1 2008-05-09 13:39:10 skim Exp $

print "Testing: Array dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
[
	'1',
	'2',
],
END
ok($obj->dump([1, 2]), $ret);
