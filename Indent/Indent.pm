#------------------------------------------------------------------------------
package Indent;
#------------------------------------------------------------------------------
# $Id: Indent.pm,v 1.2 2005-02-14 04:04:51 skim Exp $

# Modules.
use Carp;

# Global variables.
use vars qw($VERSION);

# Version.
$Indent::VERSION = '0.1';

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.

	my $class = shift;
	my $self = {};

	# Default values.
	$self->{'indent'} = '';
	$self->{'indenter'} = "\t";

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
sub add {
#------------------------------------------------------------------------------
# Add an indent to global indent.

	my $self = shift;
	my $indent = shift || $self->{'indenter'};
	$self->{'indent'} .= $indent if $indent;
}
# END of plus_indent().

#------------------------------------------------------------------------------
sub remove {
#------------------------------------------------------------------------------
# Remove an indent from global indent.

	my $self = shift;
	my $indent = shift || $self->{'indenter'};
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
