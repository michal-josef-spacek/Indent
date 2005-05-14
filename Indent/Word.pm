#------------------------------------------------------------------------------
package Indent::Word;
#------------------------------------------------------------------------------
# $Id: Word.pm,v 1.15 2005-05-14 02:02:54 skim Exp $

# Modules.
use Carp;

# Version.
our $VERSION = 0.1;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.

	my $class = shift;
	my $self = {};

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
	return bless $self, $class;
}
# END of new().

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Parses tag to indented data.
# @param $data Data string.
# @param $indent String to actual indent.
# @param $non_indent Flag, than says no-indent.

	my ($self, $data, $indent, $non_indent) = @_;

	# Undef indent.
	if (! $indent) {
		$indent = '';
	}

	# If non_indent data, than return.
	return $indent.$data if $non_indent;

	my ($first, $second) = (undef, $indent.$data);
	my $last_second_length = 0;
	my @data;
	my $one = 1;
	while (length $second >= $self->{'line_size'}
		&& $second =~ /^\s*\S+\s+/
		&& $last_second_length != length $second) {

		# Last length of non-parsed part of data.
		$last_second_length = length $second;

		# Parse to indent length.
		($first, my $tmp) = $second 
			=~ /^(.{0,$self->{'line_size'}})\s+(.*)$/;

		# If string is non-breakable in indent length, than parse to
		# blank char.
		if (! $first || length $first < length $indent
			|| $first =~ /^$indent\s*$/) {
			($first, $tmp) = $second 
				=~ /^($indent\s*[^\s]+?)\s(.*)$/;
		}

		# If parsing is right.
		if ($tmp) {

			# Non-parsed part of data.
			$second = $tmp;

			# Add next_indent to string. 
			$indent .= $self->{'next_indent'} if $one == 1;
			$one = 0;
			$second = $indent.$second;

			# Parsed part of data to @data array.
			push @data, $first;
		}
	}

	# Add other data to @data array.
	push @data, $second if $second || $second !~ /^\s*$/;

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}
# END of indent().

1;
