# Modules.
use Indent::Block;
use Test::More 'tests' => 2;

print "Testing: Indenting data.\n";
my $obj = Indent::Block->new;
my $data = ['text', 'text'];
my @ret = $obj->indent($data);
is_deeply(
	@ret, 
	'texttext',
);

$obj = Indent::Block->new(
	'line_size' => 4,
	'next_indent' => '',
);
@ret = $obj->indent($data);
is_deeply(
	\@ret,
	[
		'text',
		'text',
	],
);
