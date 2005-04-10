#!/usr/bin/perl
# $Id: 01_indent.t,v 1.4 2005-04-10 19:08:26 skim Exp $

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
	print "Error: $@" if $@;
}

