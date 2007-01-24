#------------------------------------------------------------------------------
package Indent;
#------------------------------------------------------------------------------
# $Id: Indent.pm,v 1.17 2007-01-24 23:04:15 skim Exp $

# Pragmas.
use strict;

# Modules.
use Error::Simple::Multiple qw(err);

# Version.
our $VERSION = 0.02;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.

	my $class = shift;
	my $self = bless {}, $class;

	# Default indent.
	$self->{'indent'} = '';

	# Every next indent string.
	$self->{'next_indent'} = "\t";

	# Process params.
	while (@_) {
		my $key = shift;
		my $val = shift;
		err "Unknown parameter '$key'." unless exists $self->{$key};
		$self->{$key} = $val;
	}

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub add {
#------------------------------------------------------------------------------
# Add an indent to global indent.

	my $self = shift;
	my $indent = shift || $self->{'next_indent'};
	$self->{'indent'} .= $indent if $indent;
}

#------------------------------------------------------------------------------
sub remove {
#------------------------------------------------------------------------------
# Remove an indent from global indent.

	my $self = shift;
	my $indent = shift || $self->{'next_indent'};
	my $indent_length = length $indent;
	if (substr($self->{'indent'}, -$indent_length) ne $indent) {
		err "Cannot remove indent '$indent'.";
	}
	$self->{'indent'} = substr($self->{'indent'}, 0, -$indent_length);
}

#------------------------------------------------------------------------------
sub get {
#------------------------------------------------------------------------------
# Get a indent value.

	my $self = shift;
	return $self->{'indent'};
}

#------------------------------------------------------------------------------
sub reset {
#------------------------------------------------------------------------------
# Reseting indent.

	my $self = shift;
	my $reset_value = shift || '';
	$self->{'indent'} = $reset_value;
}

1;

=pod

=head1 NAME

Indent

=head1 SYNOPSIS

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent;

 # Indent object.
 my $indent = Indent->new(

        # Begin indent.
        'indent' => '->',

        # Next indent.
        'next_indent' => "->"
 );

 # Print example.
 print $indent->get;
 print "Example\n";

 # Add indent and print ok.
 $indent->add;
 print $indent->get;
 print "Ok\n";

 # Remove indent and print nex example.
 $indent->remove;
 print $indent->get;
 print "Example2\n";

 # Reset.
 $indent->reset;

 Gets: 
 ->Example
 ->->Ok
 ->Example2

=head1 DESCRIPTION

A perl module for indent handling.

=head1 METHODS

=over 4

=item B<new($option =E<gt> $value)>

This is a class method, the constructor for Indent. Options are passed
as keyword value pairs. Recognized options are:

=over 4

=item * indent

 Default indent.
 Default value is ''.

=item * next_indent

 Next indent. Adding to internal indent variable after every add method 
 calling.
 Default value is "\t" (tabelator).

=back

=item B<add($cur_indent)>

 Method for adding $cur_indent, if defined, or 'next_indent'.

=item B<remove($cur_indent)>

 Method for removing $cur_indent, if defined, or 'next_indent'. Only if 
 is removable.

=item B<get()>

 Get actual indent string.

=item B<reset($reset_value)>

 Resets internal indent string to $reset_value or ''.

=back

=head1 AUTHORS

Michal Spacek <F<skim@skim.cz>>

=head1 VERSION

0.02

=cut

