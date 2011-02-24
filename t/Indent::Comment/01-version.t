# Modules.
use Indent::Comment;
use Test::More 'tests' => 1;

print "Testing: Version.\n";
is($Indent::Comment::VERSION, '0.03');
