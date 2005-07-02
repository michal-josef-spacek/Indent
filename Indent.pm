#------------------------------------------------------------------------------
package Indent;
#------------------------------------------------------------------------------
# $Id: Indent.pm,v 1.6 2005-07-02 15:28:47 skim Exp $

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
	bless $self, $class;

	# Default values.
	$self->{'indent'} = '';
	$self->{'next_indent'} = "\t";

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
	return $self;
}
# END of new().

#------------------------------------------------------------------------------
sub add {
#------------------------------------------------------------------------------
# Add an indent to global indent.

	my $self = shift;
	my $indent = shift || $self->{'next_indent'};
	$self->{'indent'} .= $indent if $indent;
}
# END of plus_indent().

#------------------------------------------------------------------------------
sub remove {
#------------------------------------------------------------------------------
# Remove an indent from global indent.

	my $self = shift;
	my $indent = shift || $self->{'next_indent'};
	if ($self->{'indent'} !~ /^.*$indent$/) {
		croak "$self->{'class'}: Cannot remove indent '$indent'.";
	}
	($self->{'indent'}) = $self->{'indent'} =~ /^(.*)$indent$/;
}
# END of minus_indent().

#------------------------------------------------------------------------------
sub get {
#------------------------------------------------------------------------------
# Get a indent value.

	my $self = shift;
	return $self->{'indent'};
}
# END of get_indent().

#------------------------------------------------------------------------------
sub reset {
#------------------------------------------------------------------------------
# Reseting indent.

	my $self = shift;
	my $reset_value = shift || '';
	$self->{'indent'} = $reset_value;
}
# END of reset().

1;

=head1 NAME

Indent - A perl module for indent handling.

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

=item * indent

TODO

=item * next_indent

TODO

=back

=item add

TODO

=item remove

TODO

=item get

TODO

=item reset

TODO

=head1 AUTHORS

Michal Spacek <F<skim@skim.cz>> wrote version 0.1.

=cut

