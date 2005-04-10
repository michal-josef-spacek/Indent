#!/usr/bin/perl
# $Id: data.pl,v 1.3 2005-04-10 13:06:01 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;

# Object.
my $obj = Indent::Data->new(
	'indent_len' => 10,
	'indenter' => '  ',
	'output_separator' => "\n",
);

# Indent.
my $data = $obj->indent("dddddddddddddddddddddddddwefefwefewfabcx          a");
print "$data\n";

