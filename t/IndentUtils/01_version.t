# $Id: 01_version.t,v 1.1 2005-07-04 13:48:07 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.1');
