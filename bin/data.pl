#!/usr/bin/perl
# $Id: data.pl,v 1.4 2005-04-10 14:55:20 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;

# Object.
my $obj = Indent::Data->new(
	'line_size' => 10,
	'indenter' => "\t",
	'output_separator' => "\n",
);

# Indent.
my $data = $obj->indent("dddddddddddddddddddddddddwefefwefewfabcx          a",
	'---');
print "$data\n";

