# $Id: 01_version.t,v 1.3 2007-01-24 23:56:01 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.02');
