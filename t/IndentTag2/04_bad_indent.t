# $Id: 04_bad_indent.t,v 1.1 2005-08-08 17:18:47 skim Exp $

print "Testing: Bad ident.\n" if $debug;
print "-- Bad value in line_size.\n" if $debug;
my $obj;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Bad line_size = 'ko'.");
