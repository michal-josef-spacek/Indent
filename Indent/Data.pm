#------------------------------------------------------------------------------
package Indent::Data;
#------------------------------------------------------------------------------
# $Id: Data.pm,v 1.20 2005-07-16 17:33:18 skim Exp $

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
	if ($self->{'line_size'} !~ /^\d*$/ || $self->{'line_size'} <= 0) {
		croak "$class: Bad line_size = '$self->{'line_size'}'.";
	}

	# Error with 'next_indent' length greater than 'line_size'.
	if ($self->{'line_size'} <= length $self->{'next_indent'}) {
		croak "$class: Bad line_size = '$self->{'line_size'}' ".
			"or length of string '$self->{'next_indent'}'.";
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
# @param $indent String to actual indent.
# @param $non_indent Flag, than says no-indent.

	my ($self, $data, $indent, $non_indent) = @_;

	# Undef indent.
	if (! $indent) {
		$indent = '';
	}

	# If non_indent data, than return.
	return $indent.$data if $non_indent;

	# Splits data.
	my $first = undef;
	my $second = $indent.$data;
	my @data;
	while (length $second >= $self->{'line_size'}) {
		$first = substr($second, 0, $self->{'line_size'});
		$second = $indent.$self->{'next_indent'}.substr($second, 
			$self->{'line_size'});

		# Parsed part of data to @data array.
		push @data, $first;
	}

	# Add other data to @data array.
	push @data, $second if $second;

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

1;

=head1 NAME

Indent::Data - A perl module for data indenting.

=head1 SYNOPSIS

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Data;

 # Indent::Data object.
 my $indent_data = Indent::Data->new(

        # Begin indent.
        'indent' => '->',

        # Next indent.
        'next_indent' => "->"
 );

 # Print example.
 print $indent->get();
 print "Example\n";

 # Add indent and print ok.
 $indent->add();
 print $indent->get();
 print "Ok\n";

 # Remove indent and print nex example.
 $indent->remove();
 print $indent->get();
 print "Example2\n";

 # Reset.
 $indent->reset();

 Gets: 
 ->Example
 ->->Ok
 ->Example2

=head1 DESCRIPTION

TODO

=head1 METHODS

=over 4

=item new

This is a class method, the constructor for Indent. Options are passed
as keyword value pairs. Recognized options are:

=over 4

=item * line_size

TODO

=item * next_indent

TODO

=item * output_separator

TODO

=back

=item indent

TODO

=head1 AUTHORS

Michal Spacek <F<skim@skim.cz>> wrote version 0.1.

=cut

