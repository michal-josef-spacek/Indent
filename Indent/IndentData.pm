#------------------------------------------------------------------------------
package Indenter::IndentData;
#------------------------------------------------------------------------------
# $Id: IndentData.pm,v 1.1 2005-02-14 03:50:42 skim Exp $

# Modules.
use Carp;

# Global variables.
use vars qw($VERSION);

# Version.
$Indenter::IndentData::VERSION = '0.1';

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.
	
	my $class = shift;
	my $self = {};
	
	# Default values.
	$self->{'indent_len'} = 79;
	$self->{'indenter'} = "\t";

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

	# Class.
	$self->{'class'} = $class;

	# Object.
	return bless $self, $class;
}
# END of new().

#------------------------------------------------------------------------------
sub indent_data {
#------------------------------------------------------------------------------
# Parses tag to indented data.
# @param $self Class object.
# @param $data Data string.
# @param $indent String to actual indent.
# @param $non_indent Flag, than says no-indent.

	my ($self, $data, $indent, $non_indent) = @_;

	# Undef indent.
	if (! $indent) {
		$indent = '';
	}

	# If non_indent data, than return.
	return $data if $non_indent;

	# Substitute \n -> ''.
	$data =~ s/\n//gs;

	my ($first, $second) = (undef, $indent.$data);
	my $last_second_length = 0;
	my @data;
	my $one = 1;
	while (length $second >= $self->{'indent_len'}
		&& $second =~ /^\s*\S+\s+/
		&& $last_second_length != length $second) {

		# Last length of non-parsed part of data.
		$last_second_length = length $second;

		# Parse to indent length.
		($first, my $tmp) = $second 
			=~ /^(.{0,$self->{'indent_len'}})\s+(.*)$/;

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

			# Add indenter to string. 
			$indent .= $self->{'indenter'} if $one == 1;
			$one = 0;
			$second = $indent.$second;

			# Parsed part of data to @data array.
			push @data, $first;
		}
	}

	# Add other data to @data array.
	push @data, $second if $second || $second !~ /^\s*$/;

	# Return as array or one line with \n between its.
	return wantarray ? @data : join("\n", @data);
}
# END of indent_data().

1;
