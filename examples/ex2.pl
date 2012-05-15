#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::String;

# Object.
my $i = Indent::String->new(
        'line_size' => 20,
);

# Indent.
print $i->indent(join(' ', ('text') x 7))."\n";

# Output:
# text text text text
# <--tab->text text text