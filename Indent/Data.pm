#------------------------------------------------------------------------------
package Indent::Data;
#------------------------------------------------------------------------------
# $Id: Data.pm,v 1.9 2005-04-10 15:07:57 skim Exp $

# Modules.
use Carp;

# Version.
our $VERSION = '0.1';

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.

	my $class = shift;
	my $self = {};

	# Options.
	$self->{'line_size'} = 79;
	$self->{'indenter'} = "\t";

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
	return $data if $non_indent;

	# Splits data.
	my $first = undef;
	my $second = $data;
	my @data;
	while (length $second >= $self->{'line_size'}) {
		$first = $indent.substr($second, 0, $self->{'line_size'});
		$second = $self->{'indenter'}.substr($second, 
			$self->{'line_size'});

		# Parsed part of data to @data array.
		push @data, $first;
	}

	# Add other data to @data array.
	push @data, $indent.$second if $second;

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}
# END of indent().

1;
