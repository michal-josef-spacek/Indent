# $Id: 01_version.t,v 1.4 2008-07-10 00:33:21 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.03');
