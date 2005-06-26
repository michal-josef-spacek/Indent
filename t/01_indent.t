#!/usr/bin/perl
# $Id: 01_indent.t,v 1.5 2005-06-26 10:06:38 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent;
use Test;

# Global variables.
use vars qw/$debug $obj $class $dir/;

BEGIN {
	# Name of class.
	$dir = $class = 'Indent';
	$dir =~ s/:://g;

	my $tests = `grep -r \"^ok(\" t/$dir/*.t | wc -l`;
	chomp $tests;
	plan('tests' => $tests);

	# Debug.
	$debug = 1;
}

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this class.
my @list = `ls t/$dir/*.t`;
foreach (@list) {
	chomp;
	do $_;
	print "Error: $@" if $@;
}

