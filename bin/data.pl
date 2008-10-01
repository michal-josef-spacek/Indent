#!/usr/bin/env perl

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

