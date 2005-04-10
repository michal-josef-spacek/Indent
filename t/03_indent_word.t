#!/usr/bin/perl
# $Id: 03_indent_word.t,v 1.4 2005-04-10 19:08:27 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Word;
use Test;

# Global variables.
use vars qw/$debug $obj $class/;

BEGIN {
	my $tests = `grep -r \"^ok(\" t/IndentWord/*.t | wc -l`;
	chomp $tests;
	plan('tests' => $tests);

	# Debug.
	$debug = 1;
}

# Name of class.
$class = 'Indent::Word';

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this Class.
my @list = `ls t/IndentWord/*.t`;
foreach (@list) {
	chomp;
	do $_;
	print "Error: $@" if $@;
}

