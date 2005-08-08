# $Id: 05_zero_indent.t,v 1.1 2005-08-08 17:18:47 skim Exp $

print "-- Zero line_size.\n" if $debug;
my $next_indent = '  ';
my $obj = $class->new(
	'next_indent' => $next_indent,
	'line_size' => 0
);
my $tag = '<tag param="value" param2="value2" param3="val3">';
my $ret = $obj->indent($tag);
my $right_ret = <<"END";
<tag
  param
  =
  "value"
  param2
  =
  "value2"
  param3
  =
  "val3"
  >
END
chomp $right_ret;
ok($ret, $right_ret);
