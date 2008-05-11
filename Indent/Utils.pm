#------------------------------------------------------------------------------
package Indent::Utils;
#------------------------------------------------------------------------------
# $Id: Utils.pm,v 1.22 2008-05-11 14:27:40 skim Exp $

# Pragmas.
use strict;

# Modules.
use Exporter;

# Version.
our $VERSION = 0.01;

# Length of tab.
our $tab_length = 8;

# Inheritance.
our @ISA = qw(Exporter);

# Export.
our @EXPORT_OK = qw(reduce_duplicit_ws remove_first_ws remove_last_ws remove_ws
	string_len);

#------------------------------------------------------------------------------
sub reduce_duplicit_ws($) {
#------------------------------------------------------------------------------
# Reduce duplicit blank space in string to one space.
# @param $string Reference to data string.

	my $ref_to_string = shift;
	${$ref_to_string} =~ s/\s+/\ /g;
}

#------------------------------------------------------------------------------
sub remove_first_ws($) {
#------------------------------------------------------------------------------
# Remove blank characters in begin of string.
# @param $string Reference to data string.

	my $ref_to_string = shift;
	${$ref_to_string} =~ s/^\s*//;	
}

#------------------------------------------------------------------------------
sub remove_last_ws($) {
#------------------------------------------------------------------------------
# Remove blank characters in end of string.
# @param $string Reference to data string.

	my $ref_to_string = shift;
	${$ref_to_string} =~ s/\s*$//;	
}

#------------------------------------------------------------------------------
sub remove_ws($) {
#------------------------------------------------------------------------------
# Remove white characters in begin and end of string.
# @param $string reference to data string. 

	my $ref_to_string = shift;
	remove_last_ws($ref_to_string);
	remove_first_ws($ref_to_string);
}

#------------------------------------------------------------------------------
sub string_len($) {
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

=pod

=head1 NAME

 Indent::Utils - Utilities for Indent classes.

=head1 SYNOPSIS

 use Indent::Utils qw(reduce_duplicit_ws remove_first_ws remove_last_ws remove_ws string_len);
 reduce_duplicit_ws(\$string);
 remove_first_ws(\$string);
 remove_last_ws(\$string);
 remove_ws(\$string);
 my $length_of_string = string_len($string);

=head1 SUBROUTINES

=over 8

=item B<reduce_duplicit_ws($ref_to_string)>

 Reduce duplicit blank space in string to one space.

=item B<remove_first_ws($ref_to_string)>

 Remove blank characters in begin of string.

=item B<remove_last_ws($ref_to_string)>

 Remove blank characters in end of string.

=item B<remove_ws($ref_to_string)>

 Remove white characters in begin and end of string.

=item B<string_len($string)>

 Gets length of string. 

=back

=head1 EXAMPLE

 TODO

=head1 REQUIREMENTS

L<Error::Simple::Multiple(3pm)>,
L<Exporter(3pm)>,

=head1 SEE ALSO

L<Indent(3pm)>,
L<Indent::Comment(3pm)>,
L<Indent::Block(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::Form(3pm)>,
L<Indent::PerlStruct(3pm)>,
L<Indent::Tag(3pm)>,
L<Indent::Word(3pm)>.

=head1 AUTHOR

 Michal Špaček F<tupinek@gmail.com>

=head1 VERSION

 0.01

=cut
