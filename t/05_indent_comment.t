#!/usr/bin/perl
# $Id: 05_indent_comment.t,v 1.1 2005-04-10 18:59:06 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Comment;
use Test;

# Global variables.
use vars qw/$debug $obj $class/;

BEGIN {
        my $tests = `grep -r \"^ok(\" t/IndentComment/*.t | wc -l`;
        chomp $tests;
        plan('tests' => $tests);

        # Debug.
        $debug = 1;
}

# Name of class.
$class = 'Indent::Comment';

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this Class.
my @list = `ls t/IndentComment/*.t`;
foreach (@list) {
        chomp;
        do $_;
}

