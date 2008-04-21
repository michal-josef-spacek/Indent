# $Id: 01_version.t,v 1.3 2008-04-21 00:10:52 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.02');
