#------------------------------------------------------------------------------
package Indent::Tag;
#------------------------------------------------------------------------------
# $Id: Tag.pm,v 1.15 2005-07-04 13:48:56 skim Exp $

# Pragmas.
use strict;

# Modules.
use Carp;
use Indent::Utils;

# Version.
our $VERSION = 0.1;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.
	
	my $class = shift;
	my $self = {};
	bless $self, $class;
	
	# Options.
	$self->{'line_size'} = 79;
	$self->{'next_indent'} = "\t";

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	croak "$class: Created with odd number of parameters - should be ".
		"of the form option => value." if (@_ % 2);
	for (my $x = 0; $x <= $#_; $x += 2) {
		if (exists $self->{$_[$x]}) {
			$self->{$_[$x]} = $_[$x+1];
		} else {
			croak "$class: Bad parameter '$_[$x]'.";
		}
	}

	# Line_size check.
	if ($self->{'line_size'} !~ /^\d*$/) {
		croak "$class: Bad line_size = '$self->{'line_size'}'.";
	}

	# Class.
	$self->{'class'} = $class;

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Parses tag to indented data.
# @param $tag Tag string.
# @param $indent String to actual indent.
# @param $non_indent Flag, than says no-indent.

	my ($self, $tag, $indent, $non_indent) = @_;

	# Stay.
	$self->{'stay'} = 0;

	# Undef indent.
	if (! $indent) {
		$indent = '';
	}

	# If non_indent data, than return.
	return $indent.$tag if $non_indent;

	my ($first, $second) = (undef, $indent.$tag);
	my $last_second_length = 0;
	my @data;
	my $one = 1;
	while (length $second >= $self->{'line_size'}
		&& $second =~ /^\s*\S+\s+/
		&& $last_second_length != length $second) {

		# Last length of non-parsed part of tag.
		$last_second_length = length $second;

		# Parse to indent length.
		($first, my $tmp) = $second 
			=~ /^(.{0,$self->{'line_size'}})\s+(.*\/?>)$/;

		# If string is non-breakable in indent length, than parse to
		# blank char.
		if (! $first || length $first < length $indent
			|| $first =~ /^$indent\s*$/) {
			($first, $tmp) = $second 
				=~ /^($indent\s*[^\s]+?)\s(.*\/?>)$/;
		}

		# If parsing is right.
		if ($tmp) {

			# Non-parsed part of tag.
			$second = $tmp;

			# Add next_indent to string. 
			$indent .= $self->{'next_indent'} if $one == 1;
			$one = 0;
			$second = $indent.$second;

			# Stay count increasing as non-breakable line.
			if (Indent::Utils::string_len($first) 
				> $self->{'line_size'}) {

				$self->{'stay'}++;
			}

			# Parsed part of tag to @data array.
			push @data, $first;
		}
	}

	if (Indent::Utils::string_len($second) > $self->{'line_size'}) {
		$self->{'stay'}++;
	}

	# Add other data to @data array.
	push @data, $second;

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

#------------------------------------------------------------------------------
sub stay {
#------------------------------------------------------------------------------
# Gets stay of indenting.

	my $self = shift;
	return $self->{'stay'};
}

1;

=head1 NAME

Indent::Tag - A perl module for tag indenting.

=head1 SYNOPSIS

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Tag;

 # Indent::Tag object.
 my $indent_tag = Indent::Tag->new(

        # Line size.
        'line_size' => 20,

        # Next indent.
        'next_indent' => "->",

	# Output separator.
	'output_separator' => "\n"
 );

 my $tag = '<tag param="value"></tag>

 # Indent!
 $indent_tag->indent();

=head1 DESCRIPTION

TODO

=head1 METHODS

=over 4

=item new

This is a class method, the constructor for Indent::Tag. Options are passed
as keyword value pairs. Recognized options are:

=over 4

=item * line_size

Default value of 'line_size' is 79 chars. 
TODO

=item * next_indent

Default value of 'next_indent' is tabelator (\t). 
TODO

=item * output_separator

Default value of 'output_separator' is new line (\n).
TODO

=back

=item indent

TODO

=item stay

TODO

=head1 AUTHORS

Michal Spacek <F<skim@skim.cz>> wrote version 0.1.

=cut
