#!/usr/bin/perl
# $Id: 02_indent_data.t,v 1.2 2005-02-14 04:07:33 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;
use Test;

# Global variables.
use vars qw/$debug $obj $class/;

BEGIN {
        my $tests = `grep -r \"^ok(\" t/IndentData/*.t | wc -l`;
        chomp $tests;
        plan('tests' => $tests);

        # Debug.
        $debug = 1;
}

# Name of class.
$class = 'Indent::Data';

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this Class.
my @list = `ls t/IndentData/*.t`;
foreach (@list) {
        chomp;
        do $_;
}

