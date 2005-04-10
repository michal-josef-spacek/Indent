#!/usr/bin/perl
# $Id: form.pl,v 1.2 2005-04-10 14:35:51 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;
use Dumpvalue;

# Object.
my $obj = Indent::Form->new(
	'indent_len' => 63,
	'output_separator' => "\n",
	'right_align' => 1,
	'form_separator' => ' => ',
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
my @data = $obj->indent($input);
$dump->dumpValues(@data);

