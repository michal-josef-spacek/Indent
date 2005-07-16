#------------------------------------------------------------------------------
package Indent::Comment;
#------------------------------------------------------------------------------
# $Id: Comment.pm,v 1.14 2005-07-16 17:33:18 skim Exp $

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
	my $self = bless {}, $class;
	
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
	return $self;
}

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

1;

=head1 NAME

Indent::Comment - A perl module for comment indenting.

=head1 SYNOPSIS

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Comment;

 # Indent::Comment object.
 my $indent_comment = Indent::Comment->new(

        # Begin indent.
        'indent' => '->',

        # Next indent.
        'next_indent' => "->"
 );

 Gets:
 TODO

=head1 DESCRIPTION

TODO

=head1 METHODS

=over 4

=item new

This is a class method, the constructor for Indent. Options are passed
as keyword value pairs. Recognized options are:

=over 4

=item * begin

Default value of 'begin' is ''.
TODO

=item * middle

Default value of 'middle' is ''.
TODO

=item * end

Default value of 'end' is ''.
TODO

=item * output_separator

Default value of 'output_separator' is new line (\n).
TODO

=back

=item indent

TODO

=head1 AUTHORS

Michal Spacek <F<skim@skim.cz>> wrote version 0.1.

=cut

