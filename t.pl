#!/usr/bin/perl
# $Id: t.pl,v 1.1 2005-02-14 04:05:36 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indenter::IndentData;

my $obj = new Indenter::IndentData(
	'indent_len' => 10,
	'indenter' => '  ',
);
my $data = $obj->indent_data('dddd fffffffffffffffffff  ff f f f f f f wefefwefewf');
#my $data = $obj->indent_data('dddddddddddddddddddddddddwefefwefewf');
print "$data\n";
#use Dumpvalue;
#my $dump = new Dumpvalue;
#$dump->dumpValues($data);

