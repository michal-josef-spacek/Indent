# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;
use Test::More 'tests' => 2;

print "Testing: indent() method.\n";
my $obj = Indent::Form->new(
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
my @right_ret = (
	'   Login: Michal Spacek',
	'Password: abcdefghijklmnopqrstuvw',
	'    Info: This is big info.',
);
my @ret = $obj->indent($input);
is_deeply(\@ret, \@right_ret);

$obj = Indent::Form->new(
	'line_size' => 10,
	'output_separator' => "\n",
);
@right_ret = (
	'   Login: Michal',
	'          Spacek',
	'Password: abcdefghijklmnopqrstuvw',
	'    Info: This',
	'          is',
	'          big',
	'          info.',
);
@ret = $obj->indent($input);
is_deeply(\@ret, \@right_ret);
