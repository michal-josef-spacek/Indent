# $Id: 04_bad_indent.t,v 1.1 2005-05-14 02:05:15 skim Exp $

print "Testing: Bad ident.\n" if $debug;
print "-- Zero line_size.\n" if $debug;
eval {
	$obj = new $class(
		'next_indent' => '  ',
		'line_size' => 0
	);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "Indent::Data: Bad line_size = '0'.");

print "-- Bad value in line_size.\n" if $debug;
eval {
	$obj = new $class(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "Indent::Data: Bad line_size = 'ko'.");
