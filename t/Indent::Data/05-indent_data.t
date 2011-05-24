# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;
use Test::More 'tests' => 9;

print "Testing: No-indenting data.\n";
my $obj = Indent::Data->new(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $set_no_indent = 1;
my $act_indent = '---';
my $data = 'a b c d e f g h i j k l m n o p q r s t u v w x y z' x 2;
my $ret = $obj->indent($data, $act_indent, $set_no_indent);
is(length $ret, length($data) + 3);

print "Testing: Indenting data.\n";
$set_no_indent = 0;
my @ret = $obj->indent($data, $act_indent, $set_no_indent);
my $log = 0;
foreach my $line (@ret) {
	if (length $line > 20) {
		$log = 1;
	}
}
is($#ret, 6);
is($log, 0);

@ret = $obj->indent($data);
$log = 0;
foreach my $line (@ret) {
	if (length $line > 20) {
		$log = 1;
	}
}
is($log, 0);
is($#ret, 5);

$ret = $obj->indent($data);
is(length $ret, 117);

$data = 'text text text texttexttex';
$obj = Indent::Data->new(
	'next_indent' => '  ',
	'line_size' => '10',
);
my @right_ret = (
	'text text ',
	'  text tex',
	'  ttexttex',
);
@ret = $obj->indent($data);
is_deeply(\@ret, \@right_ret);

print "Testing: Indenting data with actual indent.\n";
$data = 'text';
$obj = Indent::Data->new(
	'next_indent' => '',
	'line_size' => '5',
);
@right_ret = (
	'<-->t',
	'<-->e',
	'<-->x',
	'<-->t',
);
@ret = $obj->indent($data, '<-->');
is_deeply(\@ret, \@right_ret);

$data = 'text';
$obj = Indent::Data->new(
	'next_indent' => ' ',
	'line_size' => '5',
);
@right_ret = (
	'<->te',
	'<-> x',
	'<-> t',
);
@ret = $obj->indent($data, '<->');
is_deeply(\@ret, \@right_ret);
