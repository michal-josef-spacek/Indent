#!/usr/bin/env perl
# $Id: 03_indent_word.t,v 1.8 2005-08-10 15:44:37 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Word;
use Test;

# Global variables.
use vars qw/$debug $class $dir/;

BEGIN {
	# Name of class.
	$dir = $class = 'Indent::Word';
	$dir =~ s/:://g;

	my $tests = `egrep -r \"^[[:space:]]*ok\\(\" t/$dir/*.t | wc -l`;
	chomp $tests;
	plan('tests' => $tests);

	# Debug.
	$debug = 1;
}

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this Class.
my @list = `ls t/$dir/*.t`;
foreach (@list) {
	chomp;
	do $_;
	print "Error: $@" if $@;
}

