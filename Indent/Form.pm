#------------------------------------------------------------------------------
package Indent::Form;
#------------------------------------------------------------------------------
# $Id: Form.pm,v 1.8 2005-04-10 15:10:47 skim Exp $

# Modules.
use Carp;
use Indent::Word;

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
	$self->{'right_align'} = 1;
	$self->{'form_separator'} = ': ';
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
# Indent form data.
# @param $data Data array [['key' => 'value'], [..]];
# @param $indent String to actual indent.
# @param $non_indent Flag, than says no-indent.

	my ($self, $data, $indent, $non_indent) = @_;

	# Undef indent.
	if (! $indent) {
		$indent = '';
	}

	# Max size of key.
	my $max = 0;
	my @data;
	foreach my $dat (@{$data}) {
		if (length $dat->[0] > $max) {
			$max = length $dat->[0];
		}

		# Non-indent.
		if ($non_indent) {
			push @data, $dat->[0].$self->{'form_separator'}.
				$dat->[1];
		}
	}

	# If non-indent.
	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data) 
		if $non_indent;

	# Indent word.
	my $word = Indent::Word->new(
		'line_size' => $self->{'line_size'} - $max 
			- length $self->{'form_separator'},
		'indenter' => ' ' x ($max + length $self->{'form_separator'}),
	);

	my @data;
	foreach my $dat (@{$data}) {
		my $output = $indent;
		if ($self->{'right_align'}) {
			$output .= ' ' x ($max - length $dat->[0]);
			$output .= $dat->[0];
		} else {
			$output .= $dat->[0];
			$output .= ' ' x ($max - length $dat->[0]);
		}
		$output .= $self->{'form_separator'};
		my @tmp = $word->indent($dat->[1]);
		$output .= shift @tmp;
		push @data, $output;
		while (@tmp) {
			push @data, $indent.shift @tmp;
		}
	}

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}
# END of indent().

1;
