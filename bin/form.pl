#!/usr/bin/perl
# $Id: form.pl,v 1.6 2005-04-10 19:54:45 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;

# Object.
my $obj = Indent::Form->new(
	'line_size' => 37,
	'output_separator' => "\n",
	'right_align' => 1,
	'form_separator' => ' => ',
	'next_indent' => "--------,,,,,,,,////////",
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
print ' ' x 37, "|\n";

