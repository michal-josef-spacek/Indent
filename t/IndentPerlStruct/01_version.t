# $Id: 01_version.t,v 1.1 2008-05-09 13:39:10 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.01');
