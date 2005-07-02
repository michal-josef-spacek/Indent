#------------------------------------------------------------------------------
package Indent::Comment;
#------------------------------------------------------------------------------
# $Id: Comment.pm,v 1.11 2005-07-02 14:28:43 skim Exp $

# Pragmas.
use strict;

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
	
	# Comment type.
	$self->{'begin'} = '';
	$self->{'middle'} = '';
	$self->{'end'} = '';

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	croak "$class: Created with odd number of parameters - should be ".
		"of the form option => value." if (@_ % 2);
	for (my $x = 0; $x <= $#_; $x += 2) {
		if (exists $self->{$_[$x]}) {
			$self->{$_[$x]} = $_[$x + 1];
		} else {
			croak "$class: Bad parameter '$_[$x]'.";
		}
	}

	# Control.
	if (! $self->{'begin'} && ! $self->{'end'} && ! $self->{'middle'}) {
		croak "$class: Cannot define comments.";
	}

	# Comment tag is one.
	$self->{'one'} = 0;
	if (! $self->{'begin'} && ! $self->{'end'} && $self->{'middle'}) {
		$self->{'one'} = 1;
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

	my ($self, $data) = @_;

	# Control for data.
	if (ref $data ne 'ARRAY' || $#{$data} == -1) {
		croak "$self->{'class'}: Cannot define data.";
	}

	# Adding comments.
	my @data;
	if (! $self->{'one'}) {
		push @data, $self->{'begin'};
	}
	foreach (@{$data}) {
		push @data, $self->{'middle'}.$_;
	}
	if (! $self->{'one'}) {
		push @data, $self->{'end'};
	}

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}
# END of indent().

1;
