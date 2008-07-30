# $Id: 04_indent_array.t,v 1.3 2008-07-30 14:52:38 skim Exp $

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

$ret = <<'END';
[
	undef,
	undef,
],
END
ok($obj->indent([undef, undef]), $ret);
