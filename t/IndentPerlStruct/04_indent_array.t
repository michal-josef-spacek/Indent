# $Id: 04_indent_array.t,v 1.1 2008-05-09 14:21:22 skim Exp $

print "Testing: Array dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
[
	'1',
	'2',
],
END
ok($obj->indent([1, 2]), $ret);
