# $Id: 04_bad_indent.t,v 1.1 2005-05-14 02:15:12 skim Exp $

print "Testing: Bad ident.\n" if $debug;
print "-- Bad value in line_size.\n" if $debug;
eval {
	$obj = new $class(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "Indent::Tag: Bad line_size = 'ko'.");
