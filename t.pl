#!/usr/bin/perl
# $Id: t.pl,v 1.2 2005-02-14 04:13:04 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Data;

my $obj = new Indent::Data(
	'indent_len' => 10,
	'indenter' => '  ',
);
my $data = $obj->indent_data('dddddddddddddddddddddddddwefefwefewf');
print "$data\n";

