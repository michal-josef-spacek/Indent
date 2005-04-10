#!/usr/bin/perl
# $Id: form2.pl,v 1.1 2005-04-10 19:53:29 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;
use Dumpvalue;

# Object.
my $obj = Indent::Form->new(
	'line_size' => 37,
	'output_separator' => "\n",
	'right_align' => 1,
	'form_separator' => ' => ',
	'next_indent' => "\t\t\t",
);

# Dump object.
my $dump = Dumpvalue->new();

# Data.
my $input = [
	['Prihlasovaci jmeno', 'Michal Spacek'],
	['Heslo', 'abcdefghijklmnopqrstuvw'],
	['Popis problemu', 'Toto je ukrutny problem, protoze neni radno '.
		'prepocitavat matice.'],
];

# Indent and print to output.
my $data = $obj->indent($input);
#$dump->dumpValues(@data);
print $data."\n";
print ' ' x 37, "|\n";

