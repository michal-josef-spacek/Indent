# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 3;

# Test.
my $obj = Indent::PerlStruct->new;
my $ret = <<'END';
[
	1,
	2,
],
END
is($obj->indent([1, 2]), $ret);

# Test.
$ret = <<'END';
[],
END
is($obj->indent([]), $ret);

# Test.
$ret = <<'END';
[
	undef,
	undef,
],
END
is($obj->indent([undef, undef]), $ret);
