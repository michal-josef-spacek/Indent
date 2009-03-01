# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Indent::Tag');
}
require_ok('Indent::Tag');
