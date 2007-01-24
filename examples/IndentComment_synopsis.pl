#!/usr/bin/env perl
# $Id: IndentComment_synopsis.pl,v 1.1 2007-01-24 23:50:06 skim Exp $
 
# Pragmas.
use strict;
use warnings;

# Modules.
use Indent::Comment;

# Indent::Comment object.
my $indent_comment = Indent::Comment->new(
	'begin' => '/*',
	'middle' => ' * ',
	'end' => ' */',
);

# Print comment.
my $output = $indent_comment->indent([
	'text',
	'text',
	'text'
]);
print "$output\n";
