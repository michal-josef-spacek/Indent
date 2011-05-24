# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Block;
use Test::More 'tests' => 5;

print "Testing: Indenting data.\n";
my $obj = Indent::Block->new;
my $data_ar = ['text', 'text'];
my @ret = $obj->indent($data_ar);
is_deeply(
	\@ret, 
	[
		'texttext',
	],
);

@ret = $obj->indent($data_ar, '<--->');
is_deeply(
	\@ret,
	[
		'<--->texttext',
	],
);

@ret = $obj->indent($data_ar, '<--->', 1);
is_deeply(
	\@ret,
	[
		'<--->texttext',
	],
);

$obj = Indent::Block->new(
	'line_size' => 4,
	'next_indent' => '',
);
@ret = $obj->indent($data_ar);
is_deeply(
	\@ret,
	[
		'text',
		'text',
	],
);

@ret = $obj->indent($data_ar, undef, 1);
is_deeply(
	\@ret,
	['texttext'],
);
