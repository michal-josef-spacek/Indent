#!/usr/bin/perl
# $Id: 02_indent_data.t,v 1.1 2005-02-14 03:50:51 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indenter::IndentData;
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
$class = 'Indenter::IndentData';

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this Class.
my @list = `ls t/IndentData/*.t`;
foreach (@list) {
        chomp;
        do $_;
}

