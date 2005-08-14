#------------------------------------------------------------------------------
package Indent::Form;
#------------------------------------------------------------------------------
# $Id: Form.pm,v 1.20 2005-08-14 17:52:44 skim Exp $

# Pragmas.
use strict;

# Modules.
use Error::Simple;
use Indent::Word;

# Version.
our $VERSION = 0.01;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.
	
	my $class = shift;
	my $self = bless {}, $class;

	# Options.
	$self->{'line_size'} = 79;
	$self->{'right_align'} = 1;
	$self->{'form_separator'} = ': ';
	$self->{'next_indent'} = undef;

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@_) {
		my $key = shift;
		my $val = shift;
		err "Unknown parameter '$key'." if ! exists $self->{$key};
		$self->{$key} = $val;
	}

	# Line_size check.
	if ($self->{'line_size'} !~ /^\d*$/) {
		err "Bad line_size = '$self->{'line_size'}'.";
	}

	# Object.
	return $self;
}

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
	my $next_indent = $self->{'next_indent'} ? $self->{'next_indent'} 
		: ' ' x ($max + length $self->{'form_separator'});
	my $word = Indent::Word->new(
		'line_size' => $self->{'line_size'} - $max 
			- length $self->{'form_separator'},
		'next_indent' => $next_indent,
	);

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

1;

=head1 NAME

Indent::Form - A perl module for form indenting.

=head1 SYNOPSIS

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Form;

 # Indent object.
 my $indent = Indent::Form->new(

        # Begin indent.
        'indent' => '->',

        # Next indent.
        'next_indent' => "->"
 );
 TODO

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

=item * form_separator

Default value of 'form_separator' is ': '.
TODO

=item * line_size

Default value of 'line_size' is 79 chars.
TODO

=item * next_indent

Default value of 'next_indent' isn't define.
TODO

=item * output_separator

Default value of 'output_separator' is new line (\n).
TODO

=item * right_align

Default value of 'right_align' is 1.
TODO

=back

=item indent

TODO

=head1 AUTHORS

Michal Spacek <F<skim@skim.cz>> wrote version 0.1.

=cut
