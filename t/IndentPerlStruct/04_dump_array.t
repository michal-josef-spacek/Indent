# $Id: 04_dump_array.t,v 1.2 2008-05-09 13:55:53 skim Exp $

print "Testing: Array dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
[
	'1',
	'2',
],
END
ok($obj->indent([1, 2]), $ret);
