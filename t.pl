#!/usr/bin/perl
# $Id: t.pl,v 1.3 2005-02-14 04:16:06 skim Exp $

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

