# $Id: 01_version.t,v 1.1 2005-02-14 04:12:19 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.1');
