#!/usr/bin/perl
# $Id: data.pl,v 1.2 2005-04-01 12:02:07 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;

# Object.
my $obj = new Indent::Data(
	'indent_len' => 10,
	'indenter' => '  ',
);

# Indent.
my $data = $obj->indent('dddddddddddddddddddddddddwefefwefewf');
print "$data\n";

