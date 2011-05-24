# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

my $obj = Indent::PerlStruct->new(
	'next_indent' => '',
	'output_separator' => '',
);
my $ret = "[1,2,],";
is($obj->indent([1, 2]), $ret);
