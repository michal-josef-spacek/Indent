# $Id: 01_version.t,v 1.4 2005-09-26 18:01:59 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.01');
