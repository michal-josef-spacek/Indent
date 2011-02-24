# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 1;

print "Testing: Version.\n";
ok($Indent::PerlStruct::VERSION, '0.03');
