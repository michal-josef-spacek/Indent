# $Id: 04_bad_indent.t,v 1.7 2005-12-13 23:04:41 skim Exp $

print "Testing: Bad ident.\n" if $debug;
print "-- Bad value in line_size.\n" if $debug;
my $obj;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
ok($@, "Bad line_size = 'ko'.\n");
