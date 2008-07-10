# $Id: 04_bad_indent.t,v 1.7 2008-07-10 00:43:33 skim Exp $

print "Testing: Bad ident.\n" if $debug;
print "-- Zero line_size.\n" if $debug;
my $obj;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => 0
	);
};
ok($@, "Bad line_size = '0'.\n");

print "-- Bad value in line_size.\n" if $debug;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => 'ko'
	);
};
ok($@, "Bad line_size = 'ko'.\n");

print "-- Length of 'next_indent' is greater than or equal 'line_size'.\n" 
	if $debug;
eval {
	$obj = $class->new(
		'next_indent' => '  ',
		'line_size' => '1'
	);
};
ok($@, "Bad line_size = '1' or length of string '  '.\n");

print "Testing: Bad actual ident.\n" if $debug;
$obj = $class->new(
	'next_indent' => '',
	'line_size' => 5,
);
eval {
	$obj->indent('text', '<--->');
};
ok($@, "Bad actual indent value. Length is greater then ('line_size' - ".
	"'size of next_indent' - 1).\n");

$obj = $class->new(
	'next_indent' => ' ',
	'line_size' => 5,
);
eval {
	$obj->indent('text', '<-->');
};
ok($@, "Bad actual indent value. Length is greater then ('line_size' - ".
	"'size of next_indent' - 1).\n");
