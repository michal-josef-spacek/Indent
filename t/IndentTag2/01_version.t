# $Id: 01_version.t,v 1.1 2005-08-08 17:18:47 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.1');
