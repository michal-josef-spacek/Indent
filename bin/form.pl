#!/usr/bin/perl
# $Id: form.pl,v 1.1 2005-04-10 13:43:42 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Form;
use Dumpvalue;

# Object.
my $obj = Indent::Form->new(
	'indent_len' => 30,
	'output_separator' => "\n",
);

# Dump object.
my $dump = Dumpvalue->new();

# Data.
my $data = [
	['Prihlasovaci jmeno', 'Michal Spacek'],
	['Heslo', 'abcdefghijklmnopqrstuvw'],
	['Popis problemu', 'Toto je ukrutny problem, protoze neni radno'.
		'prepocitavat matice'],
];

# Indent and print to output.
my @data = $obj->indent($data);
$dump->dumpValues(@data);

