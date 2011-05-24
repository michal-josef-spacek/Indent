# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Comment;
use Test::More 'tests' => 5;

# Test.
my $obj = Indent::Comment->new(
	'begin' => '{',
	'end' => '}',
	'middle' => '  ',
);
my @data = ('one', 'two');
my $ret = $obj->indent(\@data);
my $right_ret = <<'END';
{
  one
  two
}
END
chomp $right_ret;
is($ret, $right_ret);

# Test.
$obj = Indent::Comment->new(
	'middle' => '# ',
);
$ret = $obj->indent(\@data);
is($ret, "# one\n# two");

# Test.
$obj = Indent::Comment->new(
	'begin' => '/*',
	'end' => ' */',
	'middle' => ' * ',
);
my @right_ret = (
	'/*',
	' * one',
	' * two',
	' */',
);
my @ret = $obj->indent(\@data);
is_deeply(\@ret, \@right_ret);

# Test.
$obj = Indent::Comment->new(
	'middle' => '-- ',
);
$ret = $obj->indent(\@data);
is($ret, "-- one\n-- two");

# Test.
$obj = Indent::Comment->new(
	'begin' => '/*',
	'end' => ' */',
	'line_size' => 5,
	'middle' => ' * ',
);
@right_ret = (
	'/*',
	' * ab',
	' * abc',
	' * abcd',
	' */',
);
@ret = $obj->indent('ab abc abcd');
is_deeply(\@ret, \@right_ret);
