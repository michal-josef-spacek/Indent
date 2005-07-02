#!/usr/bin/perl
# $Id: data.pl,v 1.5 2005-07-02 13:51:07 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;

# Object.
my $obj = Indent::Data->new(
	'line_size' => 10,
	'next_indent' => "\t",
	'output_separator' => "\n",
);

# Indent.
my $data = $obj->indent("dddddddddddddddddddddddddwefefwefewfabcx          a",
	'---');
print "$data\n";

