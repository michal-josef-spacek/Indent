# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent::Comment;
use Test::More 'tests' => 2;

my $obj = Indent::Comment->new(
	'begin' => '{',
	'end' => '}'
);
my @data = ();
eval {
	$obj->indent(@data);
};
is($EVAL_ERROR, "Cannot define data.\n");

$obj = Indent::Comment->new(
	'begin' => '{',
	'end' => '}'
);
eval {
	$obj->indent(\@data);
};
is($EVAL_ERROR, "Cannot define data.\n");
