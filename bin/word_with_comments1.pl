#!/usr/bin/perl
# $Id: word_with_comments1.pl,v 1.1 2005-04-02 15:56:59 skim Exp $

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Word;
use Indent::Comment;
use Dumpvalue;

# Objects.
my $word = new Indent::Word(
	'indent_len' => 10,
	'indenter' => '',
);
my $comments = new Indent::Comment(
	'middle' => '# ',
);

# Indent data.
my @data = $word->indent('aaaaa bbbbb ddddd eeeee fffff ggggg hhhhh fffff'.
	' dddd dddd ffff gerg gergrg grgerger grger ');

# Adding comments.
my @data2 = $comments->indent(\@data);

# Dump data.
my $dump = new Dumpvalue;
$dump->dumpValues(@data2);



