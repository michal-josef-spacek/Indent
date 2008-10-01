print "Testing: Version.\n" if $debug;
ok(eval('$'.$class.'::VERSION'), '0.01');
