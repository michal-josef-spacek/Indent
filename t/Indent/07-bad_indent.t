# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Indent;
use Test::More 'tests' => 3;

print "Testing: Bad indent.\n";
my $obj = Indent->new;
is($obj->get, '');
$obj->add('---');
is($obj->get, '---');
eval {
	$obj->remove('aa');
};
is($EVAL_ERROR, "Cannot remove indent 'aa'.\n");
