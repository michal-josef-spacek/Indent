# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Indent::PerlStruct');
}
require_ok('Indent::PerlStruct');
