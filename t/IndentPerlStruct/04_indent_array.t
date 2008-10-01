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
