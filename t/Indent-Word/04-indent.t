# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Word;
use Term::ANSIColor;
use Test::More 'tests' => 10;
use Test::NoWarnings;
use Text::ANSI::Util qw(ta_strip);

# Test.
my $obj = Indent::Word->new(
	'next_indent' => '  ',
	'line_size' => '20',
);
my $data = 'a b c d e f g h i j k l m n o p q r s t u v w x y z' x 2;
my $ret = $obj->indent($data, '---', 1);
my $right_ret = '---a b c d e f g h i j k l m n o p q r s t u v w x y z'.
	'a b c d e f g h i j k l m n o p q r s t u v w x y z';
is($ret, $right_ret, 'Test for no indent flag.');

# Test.
my @ret = $obj->indent($data, '---', 0);
is_deeply(
	\@ret,
	[
		"---a b c d e f g h i",
		"---  j k l m n o p q",
		"---  r s t u v w x y",
		"---  za b c d e f g",
		"---  h i j k l m n o",
		"---  p q r s t u v w",
		"---  x y z"
	],
	'Test for indenting per 20 char on line.',
);

# Test.
$data = 'abcdefghijklmnopqrstuvwxyz' x 3;
$ret = $obj->indent($data, '---', 0);
is($ret, '---abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdef'.
	'ghijklmnopqrstuvwxyz', 'Test for one word.');

# Test.
$obj = Indent::Word->new(
	'next_indent' => '',
	'line_size' => '5',
);
$ret = $obj->indent('text', '<-->');
is(
	$ret,
	'<-->text',
	'Test for short string #1.',
);

# Test.
$obj = Indent::Word->new(
	'next_indent' => ' ',
	'line_size' => '5',
);
@ret = $obj->indent('text text', '<->');
is_deeply(
	\@ret,
	[
		'<->text',
		'<-> text',
	],
	'Test for short string #2.',
);

# Test.
my $next_indent = '  ';
$obj = Indent::Word->new(
	'next_indent' => $next_indent,
	'line_size' => 0,
);
$ret = $obj->indent('word1 word2 word3');
is(
	$ret,
	"word1\n".$next_indent."word2\n".$next_indent."word3",
	'Test indenting in scalar context.',
);

# Test.
$obj = Indent::Word->new(
	'next_indent' => '',
	'line_size' => 2,
);
@ret = $obj->indent('aa    ');
is_deeply(
	\@ret,
	[
		'aa',
	],
	'Word with equal characters as line_size and trailing whitespace.',
);

# Test
$obj = Indent::Word->new(
	'next_indent' => '',
	'line_size' => 1,
);
@ret = $obj->indent('aa    ');
is_deeply(
	\@ret,
	[
		'aa',
	],
	'Word with more characters than line_size and trailing whitespace.',
);

# Test.
@ret = $obj->indent('');
is_deeply(
	\@ret,
	[],
	'No string to indent.',
);

# Test.
$obj = Indent::Word->new(
	'ansi' => 1,
	'line_size' => '20',
	'next_indent' => '  ',
);
$data = '';
my $num = 0;
foreach my $char ('a' .. 'z') {
	if ($data) {
		$data .= ' ';
	}
	$num++;
	if ($num % 2 == 0) {
		$data .= color('red').$char.color('reset');
	} else {
		$data .= color('cyan').$char.color('reset');
	}
}
@ret = $obj->indent($data, '---', 0);
@ret = map { ta_strip($_); } @ret;
is_deeply(
	\@ret,
	[
		'---a b c d e f g h i',
		'---  j k l m n o p q',
		'---  r s t u v w x y',
		'---  z',
	],
	'Test for indenting per 20 char on line.',
);
