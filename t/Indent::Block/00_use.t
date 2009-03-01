# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Indent::Block');
}
require_ok('Indent::Block');
