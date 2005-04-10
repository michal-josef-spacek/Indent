#!/usr/bin/perl
# $Id: word_with_comments1.pl,v 1.4 2005-04-10 21:07:42 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Word;
use Indent::Comment;
use Dumpvalue;

# Objects.
my $word = Indent::Word->new(
	'line_size' => 10,
	'next_indent' => '',
);
my $comments = Indent::Comment->new(
	'middle' => '# ',
);

# Indent data.
my @data = $word->indent('aaaaa bbbbb ddddd eeeee fffff ggggg hhhhh fffff'.
	' dddd dddd ffff gerg gergrg grgerger grger ');

# Adding comments.
my @data2 = $comments->indent(\@data);

# Dump data.
my $dump = Dumpvalue->new();
$dump->dumpValues(@data2);

