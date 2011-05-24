# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;
use Test::More 'tests' => 1;

# Test.
my $obj = Indent::Data->new(
	'next_indent' => '',
	'line_size' => '1',
	'output_separator' => '-'
);
my $data = 'abcd';
my $ret = $obj->indent($data);
is($ret, 'a-b-c-d');
