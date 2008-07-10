# $Id: 03_indent_block.t,v 1.2 2008-07-10 13:55:30 skim Exp $

print "Testing: Indenting data.\n" if $debug;
my $obj = $class->new;
my $data = ['text', 'text'];
my @ret = $obj->indent($data);
ok($#ret, 0);
ok($ret[0], 'texttext');

$obj = $class->new(
	'line_size' => 4,
	'next_indent' => '',
);
@ret = $obj->indent($data);
ok($#ret, 1);
ok($ret[0], 'text');
ok($ret[1], 'text');
