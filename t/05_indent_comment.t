#!/usr/bin/perl
# $Id: 05_indent_comment.t,v 1.4 2005-06-26 10:06:38 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Comment;
use Test;

# Global variables.
use vars qw/$debug $obj $class $dir/;

BEGIN {
	# Name of class.
	$dir = $class = 'Indent::Comment';
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

