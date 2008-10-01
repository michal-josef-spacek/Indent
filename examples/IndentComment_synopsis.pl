#!/usr/bin/env perl
 
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
