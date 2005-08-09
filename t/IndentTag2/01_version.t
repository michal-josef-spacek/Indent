# $Id: 01_version.t,v 1.2 2005-08-09 06:52:10 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.01');
