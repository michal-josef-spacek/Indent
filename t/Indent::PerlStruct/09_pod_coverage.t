# Modules.
use Test::Pod::Coverage 'tests' => 1;

print "Testing: Pod coverage.\n";
pod_coverage_ok('Indent::PerlStruct', 'Indent::PerlStruct is covered.');
