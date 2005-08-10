#!/usr/bin/env perl
# $Id: 06_indent_form.t,v 1.7 2005-08-10 15:44:37 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;
use Test;

# Global variables.
use vars qw/$debug $class $dir/;

BEGIN {
	# Name of class.
	$dir = $class = 'Indent::Form';
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

