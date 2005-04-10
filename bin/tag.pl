#!/usr/bin/perl
# $Id: tag.pl,v 1.1 2005-04-10 20:45:05 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Tag;

# Object.
my $line = 10;
my $obj = Indent::Tag->new(
	'line_size' => $line,
	'next_indent' => "\t",
	'output_separator' => "\n",
);

# Indent.
my $data = $obj->indent(<<"END");
<tag neco="cosi">
END
print "$data\n";
print '-' x $line, "\n";
