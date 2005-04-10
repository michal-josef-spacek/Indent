#!/usr/bin/perl
# $Id: 06_indent_form.t,v 1.2 2005-04-10 19:06:56 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;
use Test;

# Global variables.
use vars qw/$debug $obj $class/;

BEGIN {
	my $tests = `grep -r \"^ok(\" t/IndentForm/*.t | wc -l`;
	chomp $tests;
	plan('tests' => $tests);

	# Debug.
	$debug = 1;
}

# Name of class.
$class = 'Indent::Form';

# Prints debug information about class.
print "\nClass '$class'\n" if $debug;

# For every test for this Class.
my @list = `ls t/IndentForm/*.t`;
foreach (@list) {
	chomp;
	do $_;
}

