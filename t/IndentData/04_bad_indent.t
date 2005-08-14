# $Id: 04_bad_indent.t,v 1.4 2005-08-14 17:50:03 skim Exp $

print "Testing: Bad ident.\n" if $debug;
print "-- Zero line_size.\n" if $debug;
my $obj;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => 0
	);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Bad line_size = '0'.\n");

print "-- Bad value in line_size.\n" if $debug;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Bad line_size = 'ko'.\n");

print "-- Length of 'next_indent' is greater than or equal 'line_size'.\n" 
	if $debug;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => '1'
	);
};
$@ =~ s/(.*)\ at.*\n/$1/;
ok($@, "$class: Bad line_size = '1' or length of string '  '.\n");
