#!/usr/bin/perl
# $Id: data.pl,v 1.1 2005-04-02 15:56:59 skim Exp $

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

