# Modules.
use Indent::Block;
use Test::More 'tests' => 5;

print "Testing: Indenting data.\n";
my $obj = Indent::Block->new;
my $data = ['text', 'text'];
my @ret = $obj->indent($data);
is($#ret, 0);
is($ret[0], 'texttext');

$obj = Indent::Block->new(
	'line_size' => 4,
	'next_indent' => '',
);
@ret = $obj->indent($data);
is($#ret, 1);
is($ret[0], 'text');
is($ret[1], 'text');
