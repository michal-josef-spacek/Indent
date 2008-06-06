# $Id: 04_indent_array.t,v 1.2 2008-06-06 07:48:34 skim Exp $

print "Testing: Array dump.\n" if $debug;
my $obj = $class->new;
my $ret = <<'END';
[
	'1',
	'2',
],
END
ok($obj->indent([1, 2]), $ret);

$ret = <<'END';
[],
END
ok($obj->indent([]), $ret);
