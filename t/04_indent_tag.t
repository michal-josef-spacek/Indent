#!/usr/bin/perl
# $Id: 04_indent_tag.t,v 1.1 2005-02-14 04:12:21 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Tag;
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
$class = 'Indent::Tag';

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this Class.
my @list = `ls t/IndentData/*.t`;
foreach (@list) {
        chomp;
        do $_;
}

