# $Id: 01_version.t,v 1.3 2008-08-21 11:26:46 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.03');
