#!/usr/bin/perl
# $Id: data.pl,v 1.1 2005-02-14 12:13:42 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;

my $obj = new Indent::Data(
	'indent_len' => 10,
	'indenter' => '  ',
);
my $data = $obj->indent('dddddddddddddddddddddddddwefefwefewf');
print "$data\n";

