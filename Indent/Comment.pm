#------------------------------------------------------------------------------
package Indent::Comment;
#------------------------------------------------------------------------------
# $Id: Comment.pm,v 1.17 2005-11-03 12:49:09 skim Exp $

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
	
	# Comment type.
	$self->{'begin'} = '';
	$self->{'middle'} = '';
	$self->{'end'} = '';

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@_) {
		my $key = shift;
		my $val = shift;
		err "Unknown parameter '$key'." unless exists $self->{$key};
		$self->{$key} = $val;
	}

	# Control.
	unless ($self->{'begin'} || $self->{'end'} || $self->{'middle'}) {
		err "Cannot define comments.";
	}

	# Comment tag is one.
	$self->{'one'} = 0;
	if (! $self->{'begin'} && ! $self->{'end'} && $self->{'middle'}) {
		$self->{'one'} = 1;
	}

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
		err "Cannot define data.";
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

