#!/usr/bin/perl
# $Id: 01_indent.t,v 1.2 2005-02-14 04:07:33 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent;
use Test;

# Global variables.
use vars qw/$debug $obj $class/;

BEGIN {
        my $tests = `grep -r \"^ok(\" t/Indent/*.t | wc -l`;
        chomp $tests;
        plan('tests' => $tests);

        # Debug.
        $debug = 1;
}

# Name of class.
$class = 'Indent';

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this class.
my @list = `ls t/Indent/*.t`;
foreach (@list) {
        chomp;
        do $_;
}

