# $Id: 04_bad_indent.t,v 1.2 2005-08-14 18:00:13 skim Exp $

print "Testing: Bad ident.\n" if $debug;
print "-- Bad value in line_size.\n" if $debug;
my $obj;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
ok($@, "$class: Bad line_size = 'ko'.\n");
