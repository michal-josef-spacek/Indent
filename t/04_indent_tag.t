#!/usr/bin/perl
# $Id: 04_indent_tag.t,v 1.2 2005-04-10 18:59:02 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Tag;
use Test;

# Global variables.
use vars qw/$debug $obj $class/;

BEGIN {
        my $tests = `grep -r \"^ok(\" t/IndentTag/*.t | wc -l`;
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
my @list = `ls t/IndentTag/*.t`;
foreach (@list) {
        chomp;
        do $_;
}

