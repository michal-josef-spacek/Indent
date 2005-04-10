#!/usr/bin/perl
# $Id: data.pl,v 1.2 2005-04-10 12:49:16 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;

# Object.
my $obj = Indent::Data->new(
	'indent_len' => 10,
	'indenter' => '  ',
);

# Indent.
my $data = $obj->indent('dddddddddddddddddddddddddwefefwefewf');
print "$data\n";

