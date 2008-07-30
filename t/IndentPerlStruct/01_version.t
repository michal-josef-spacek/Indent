# $Id: 01_version.t,v 1.2 2008-07-30 14:53:09 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.02');
