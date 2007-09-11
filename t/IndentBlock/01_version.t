# $Id: 01_version.t,v 1.1 2007-09-11 00:05:19 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.01');
