# $Id: 01_version.t,v 1.1 2005-04-10 18:59:09 skim Exp $

print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.1');
