#------------------------------------------------------------------------------
package Indent::Utils;
#------------------------------------------------------------------------------

# Pragmas.
use base qw(Exporter);
use strict;
use warnings;

# Modules.
use Readonly;

# Constants.
Readonly::Scalar my $DEFAULT_TAB_LENGTH => 8;
Readonly::Scalar my $SPACE => ' ';

# Version.
our $VERSION = 0.01;

# Length of tab.
our $TAB_LENGTH = $DEFAULT_TAB_LENGTH;

# Export.
our @EXPORT_OK = qw(reduce_duplicit_ws remove_first_ws remove_last_ws remove_ws
	string_len);

#------------------------------------------------------------------------------
sub reduce_duplicit_ws {
#------------------------------------------------------------------------------
# Reduce duplicit blank space in string to one space.
# @param $string Reference to data string.

	my $ref_to_string = shift;
	${$ref_to_string} =~ s/\s+/\ /gsm;
	return;
}

#------------------------------------------------------------------------------
sub remove_first_ws {
#------------------------------------------------------------------------------
# Remove blank characters in begin of string.
# @param $string Reference to data string.

	my $ref_to_string = shift;
	${$ref_to_string} =~ s/^\s*//sm;
	return;
}

#------------------------------------------------------------------------------
sub remove_last_ws {
#------------------------------------------------------------------------------
# Remove blank characters in end of string.
# @param $string Reference to data string.

	my $ref_to_string = shift;
	${$ref_to_string} =~ s/\s*$//sm;
	return;
}

#------------------------------------------------------------------------------
sub remove_ws {
#------------------------------------------------------------------------------
# Remove white characters in begin and end of string.
# @param $string reference to data string.

	my $ref_to_string = shift;
	remove_last_ws($ref_to_string);
	remove_first_ws($ref_to_string);
	return;
}

#------------------------------------------------------------------------------
sub string_len {
#------------------------------------------------------------------------------
# Gets length of string.
# @param $string Data string.
# @return $length_of_string Length of data string, when '\t' translate to
# $TAB_LENGTH x space.

	my $string = shift;
	my $tmp = $SPACE x $TAB_LENGTH;
	$string =~ s/\t/$tmp/gsm;
	my $length_of_string = length $string;
	return $length_of_string;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

 Indent::Utils - Utilities for Indent classes.

=head1 SYNOPSIS

 use Indent::Utils qw(reduce_duplicit_ws remove_first_ws remove_last_ws remove_ws string_len);
 reduce_duplicit_ws(\$string);
 remove_first_ws(\$string);
 remove_last_ws(\$string);
 remove_ws(\$string);
 my $length_of_string = string_len($string);

=head1 GLOBAL VARIABLES

=over 8

=item B<TAB_LENGTH>

 Default length of tabelator is 8 chars.

=back

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

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Utils qw(reduce_duplicit_ws);

 my $input = 'a  b';
 reduce_duplicit_ws(\$input);
 print "$input|\n";

 # Output:
 # a b|

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Utils qw(remove_first_ws);

 my $input = '  a';
 remove_first_ws(\$input);
 print "$input|\n";

 # Output:
 # a|

=head1 EXAMPLE3

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Utils qw(remove_last_ws);

 my $input = 'a   ';
 remove_last_ws(\$input);
 print "$input|\n";

 # Output:
 # a|

=head1 EXAMPLE4

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Utils qw(remove_ws);

 my $input = '   a   ';
 remove_ws(\$input);
 print "$input|\n";

 # Output:
 # a|

=head1 EXAMPLE5

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Utils qw(string_len);

 # Print string length.
 print string_len("\tab\t")."\n";

 # Output:
 # 18

=head1 DEPENDENCIES

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

=head1 LICENSE AND COPYRIGHT

 BSD license.

=head1 VERSION

 0.01

=cut
