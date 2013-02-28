# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Block;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Indent::Block::VERSION, 0.02, 'Version.');
