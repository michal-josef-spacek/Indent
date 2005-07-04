#!/usr/bin/perl
# $Id: 07_indent_utils.t,v 1.1 2005-07-04 13:48:17 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Utils;
use Test;

# Global variables.
use vars qw/$debug $obj $class $dir/;

BEGIN {
	# Name of class.
	$dir = $class = 'Indent::Utils';
	$dir =~ s/:://g;

	my $tests = `grep -r \"^ok(\" t/$dir/*.t | wc -l`;
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

