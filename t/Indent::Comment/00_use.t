# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Indent::Comment');
}
require_ok('Indent::Comment');
