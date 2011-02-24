# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Indent::Sexpression');
}
require_ok('Indent::Sexpression');
