#------------------------------------------------------------------------------
package Indent::Data;
#------------------------------------------------------------------------------
# $Id: Data.pm,v 1.26 2007-01-25 00:02:00 skim Exp $

# Pragmas.
use strict;

# Modules.
use Error::Simple::Multiple qw(err);

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
	$self->{'next_indent'} = "\t";

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@_) {
		my $key = shift;
		my $val = shift;
		err "Unknown parameter '$key'." unless exists $self->{$key};
		$self->{$key} = $val;
	}

	# Line_size check.
	if ($self->{'line_size'} !~ /^\d*$/ || $self->{'line_size'} <= 0) {
		err "Bad line_size = '$self->{'line_size'}'.";
	}

	# Error with 'next_indent' length greater than 'line_size'.
	if ($self->{'line_size'} <= length $self->{'next_indent'}) {
		err "Bad line_size = '$self->{'line_size'}' ".
			"or length of string '$self->{'next_indent'}'.";
	}

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

=pod

=head1 NAME

 Indent::Data

=head1 SYNOPSIS

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Data;

 # Indent::Data object.
 my $indent_data = Indent::Data->new(
	TODO
 );

 TODO

 Gets: 
 TODO

=head1 DESCRIPTION

 A perl module for data indenting.

=head1 METHODS

=over 4

=item B<new(TODO)>

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

=item B<indent(TODO)>

 TODO

=head1 AUTHORS

 Michal Spacek <F<skim@skim.cz>>

=head1 VERSION

 0.01

=cut

