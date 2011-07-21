# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Block;
use Test::More 'tests' => 5;

# Test.
my $obj = Indent::Block->new;
my @data = ('text', 'text');
my @ret = $obj->indent(\@data);
is_deeply(
	\@ret, 
	[
		'texttext',
	],
);

# Test.
@ret = $obj->indent(\@data, '<--->');
is_deeply(
	\@ret,
	[
		'<--->texttext',
	],
);

# Test.
@ret = $obj->indent(\@data, '<--->', 1);
is_deeply(
	\@ret,
	[
		'<--->texttext',
	],
);

# Test.
$obj = Indent::Block->new(
	'line_size' => 4,
	'next_indent' => '',
);
@ret = $obj->indent(\@data);
is_deeply(
	\@ret,
	[
		'text',
		'text',
	],
);

# Test.
@ret = $obj->indent(\@data, undef, 1);
is_deeply(
	\@ret,
	['texttext'],
);
