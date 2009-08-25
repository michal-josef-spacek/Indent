# Modules.
use Indent::PerlStruct;
use Test::More 'tests' => 3;

print "Testing: Array dump.\n";
my $obj = Indent::PerlStruct->new;
my $ret = <<'END';
[
	1,
	2,
],
END
is($obj->indent([1, 2]), $ret);

$ret = <<'END';
[],
END
is($obj->indent([]), $ret);

$ret = <<'END';
[
	undef,
	undef,
],
END
is($obj->indent([undef, undef]), $ret);
