#!/usr/bin/perl
# $Id: tag2.pl,v 1.2 2005-08-08 19:37:47 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Tag;

# Object.
my $line = 20;
my $obj = Indent::Tag->new(
	'line_size' => $line,
	'next_indent' => "\t",
	'output_separator' => "\n",
);

# Indent.
my $data = $obj->indent(<<"END");
<tag neco="cosi cosi cosi cosi" hehe="oooo" />
END
print "$data\n";
print '-' x $line, "\n";
