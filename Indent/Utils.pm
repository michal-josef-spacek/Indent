#------------------------------------------------------------------------------
package Indent::Utils;
#------------------------------------------------------------------------------
# $Id: Utils.pm,v 1.11 2005-07-04 13:49:01 skim Exp $

# Pragmas.
use strict;

# Modules.
use Carp;

# Version.
our $VERSION = 0.1;

# Length of tab.
our $tab_length = 8;

#------------------------------------------------------------------------------
sub remove_first {
#------------------------------------------------------------------------------
# Remove blank characters on begin of string.
# @param $string Data string.

	my $string = shift;
	${$string} =~ s/^\s*//;	
}

#------------------------------------------------------------------------------
sub remove_last {
#------------------------------------------------------------------------------
# Remove blank characters on end of string.
# @param $string Data string.

	my $string = shift;
	${$string} =~ s/\s*$//;	
}

#------------------------------------------------------------------------------
sub remove {
#------------------------------------------------------------------------------
# Remove blank characters on begin and end of string.
# @param $string Data string. 

	my $string = shift;
	remove_last($string);
	remove_first($string);
}

#------------------------------------------------------------------------------
sub string_len {
#------------------------------------------------------------------------------
# Gets length of string. 
# @param $string Data string.
# @return $length_of_string Length of data string, when '\t' translate to
# $tab_length x space.

	my $string = shift;
	my $tmp = ' ' x $tab_length;
	$string =~ s/\t/$tmp/g;	
	my $length_of_string = length $string;
	return $length_of_string;	
} 

1;
