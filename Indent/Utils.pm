#------------------------------------------------------------------------------
package Indent::Utils;
#------------------------------------------------------------------------------
# $Id: Utils.pm,v 1.13 2005-07-06 07:01:42 skim Exp $

# Pragmas.
use strict;

# Modules.
use Carp;
use Exporter;

# Version.
our $VERSION = 0.1;

# Length of tab.
our $tab_length = 8;

# Global variables.
# use vars qw(@ISA @EXPORT_OK);

# Inheritance.
@ISA = qw(Exporter);

# Export.
@EXPORT_OK = qw(remove_first_ws remove_last_ws remove_ws reduce_duplicit_ws
	string_len);

#------------------------------------------------------------------------------
sub remove_first_ws {
#------------------------------------------------------------------------------
# Remove blank characters in begin of string.
# @param $string Reference to data string.

	my $string = shift;
	${$string} =~ s/^\s*//;	
}

#------------------------------------------------------------------------------
sub remove_last_ws {
#------------------------------------------------------------------------------
# Remove blank characters in end of string.
# @param $string Reference to data string.

	my $string = shift;
	${$string} =~ s/\s*$//;	
}

#------------------------------------------------------------------------------
sub remove_ws {
#------------------------------------------------------------------------------
# Remove white characters in begin and end of string.
# @param $string reference to data string. 

	my $string = shift;
	remove_last_ws($string);
	remove_first_ws($string);
}

#------------------------------------------------------------------------------
sub reduce_duplicit_ws {
#------------------------------------------------------------------------------
# Reduce duplicit blank space in string to one space.
# @param $string Reference to data string.

	my $string = shift;
	${$string} =~ s/\s+/\ /g;
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
