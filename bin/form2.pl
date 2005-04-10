#!/usr/bin/perl
# $Id: form2.pl,v 1.3 2005-04-10 21:16:06 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;

# Object.
my $line_size = 37;
my $obj = Indent::Form->new(
	'line_size' => $line_size,
	'output_separator' => "\n",
	'right_align' => 1,
	'form_separator' => ' => ',
	'next_indent' => "\t\t\t",
);

# Data.
my $input = [
	['Prihlasovaci jmeno', 'Michal Spacek'],
	['Heslo', 'abcdefghijklmnopqrstuvw'],
	['Popis problemu', 'Toto je ukrutny problem, protoze neni radno '.
		'prepocitavat matice.'],
];

# Indent and print to output.
my $data = $obj->indent($input);
print $data."\n";
print ' ' x $line_size, "|\n";

