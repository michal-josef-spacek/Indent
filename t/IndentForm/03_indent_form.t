print "Testing: indent() method.\n" if $debug;
my $obj = $class->new(
	'line_size' => 80,
	'output_separator' => "\n",
);

# Data.
my $input = [
        ['Login', 'Michal Spacek'],
        ['Password', 'abcdefghijklmnopqrstuvw'],
        ['Info', 'This is big info.'],
];

# Indent and print to output.
my @data = $obj->indent($input);
ok($data[0], '   Login: Michal Spacek');
ok($data[1], 'Password: abcdefghijklmnopqrstuvw');
ok($data[2], '    Info: This is big info.');

$obj = $class->new(
	'line_size' => 10,
	'output_separator' => "\n",
);
@data = $obj->indent($input);
ok($data[0], '   Login: Michal');
ok($data[1], '          Spacek');
ok($data[2], 'Password: abcdefghijklmnopqrstuvw');
ok($data[3], '    Info: This');
ok($data[4], '          is');
ok($data[5], '          big');
ok($data[6], '          info.');
