#------------------------------------------------------------------------------
package Indent::Block;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);
use Indent::Utils qw(set_params string_len);
use Readonly;

# Constants.
Readonly::Scalar my $EMPTY_STR => q{};
Readonly::Scalar my $LINE_SIZE => 79;

# Version.
our $VERSION = 0.01;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.

	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Options.
	$self->{'line_size'} = $LINE_SIZE;
	$self->{'next_indent'} = "\t";

	# Output.
	$self->{'output_separator'} = "\n";

	# Strict mode - without white space optimalization.
	$self->{'strict'} = 1;

	# Process params.
	set_params($self, @params);

	# Line_size check.
	if ($self->{'line_size'} !~ /^\d*$/ms) {
		err "Bad line_size = '$self->{'line_size'}'.";
	}

	# Save current piece.
	$self->{'_current'} = $EMPTY_STR;

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Parses tag to indented data.

	my ($self, $data, $act_indent, $non_indent) = @_;

	# Undef indent.
	if (! $act_indent) {
		$act_indent = $EMPTY_STR;
	}

	# Input data.
	my @input = @{$data};

	# If non_indent data, than return.
	if ($non_indent) {
		return $act_indent.join($EMPTY_STR, @input);
	}

	# Indent.
	my @data = ();
	my ($first, $second);
	$first = shift @input;
	my $tmp_indent = $act_indent;
	while (@input) {
		$second = shift @input;
		if ($self->_compare($first, $second, $tmp_indent)) {
			push @data, $self->{'_current'};
			$first = $second;
			$second = $EMPTY_STR;
			$tmp_indent = $act_indent.$self->{'next_indent'};
		} else {
			$first .= $second;
		}
	}

	# Add other data to @data array.
	if ($first) {

		# White space optimalization.
		if (! $self->{'strict'}) {
			$first =~ s/^\s*//ms;
			$first =~ s/\s*$//ms;
		}
		if ($first ne $EMPTY_STR) {
			push @data, $tmp_indent.$first;
		}
	}

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

#------------------------------------------------------------------------------
# Private methods.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
sub _compare {
#------------------------------------------------------------------------------
# Compare strings with 'line_size' and save right current string.

	my ($self, $first, $second, $act_indent) = @_;

	# Without optimalization.
	if ($self->{'strict'}) {
		if (length $first > 0
			&& (string_len($act_indent.$first)
			>= $self->{'line_size'}
			|| string_len($act_indent.$first.$second)
			> $self->{'line_size'})) {

			$self->{'_current'} = $act_indent.$first;
			return 1;
		} else {
			return 0;
		}

	# With optimalizaton.
	# TODO Rewrite.
	} else {
		my $tmp1 = $first;
		$tmp1 =~ s/^\s*//ms;
		$tmp1 =~ s/\s*$//ms;
		if (length $tmp1 > 0
			&& string_len($act_indent.$tmp1)
			>= $self->{'line_size'}) {

			$self->{'_current'} = $act_indent.$tmp1;
			return 1;
		} else {
			my $tmp2 = $first.$second;
			$tmp2 =~ s/^\s*//ms;
			$tmp2 =~ s/\s*$//ms;
			if (length $tmp1 > 0
				&& string_len($act_indent.$tmp2)
				> $self->{'line_size'}) {

				$self->{'_current'} = $act_indent.$tmp1;
				return 1;
			} else {
				return 0;
			}
		}
	}
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

 Indent::Block - Class for block indent.

=head1 SYNOPSIS

 use Indent::Block;
 my $i = Indent::Block->new(%parameters);
 print $i->indent($data, [$act_indent, $non_indent]);

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=over 8

=item * B<line_size>

 Sets indent line size value.
 Default value is 'line_size' => 79.

=item * B<next_indent>

 Sets next indent string.
 Default value is 'next_indent' => "\t" (tabelator).

=item * B<output_separator>

 Sets output separator between indented datas for string context.
 Default value is 'output_separator' => "\n" (new line).

=item * B<strict>

 Sets or unsets strict mode.
 Unset strict mode means whitespace optimalization.
 Default value is 'strict' => 1.

=back

=item B<indent($data, [$act_indent, $non_indent])>

 Indent method.
 - $data - Reference to array with strings to indent.
 - $act_indent - String to actual indent.
 - $non_indent - Flag, that says 'no-indent' for current time.

=back

=head1 ERRORS

 Mine:
   TODO

 From CSS::Structure::Utils:
   Unknown parameter '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Block;

 # Object.
 my $i = Indent::Block->new(
         'line_size' => 2,
	 'next_indent' => '',
 );

 # Print in scalar context.
 print $i->indent(['text', 'text', 'text'])."\n";

 # Output:
 # text
 # text
 # text

=head1 DEPENDENCIES

L<Error::Simple::Multiple(3pm)>,
L<Indent::Utils(3pm)>,
L<Readonly(3pm)>.

=head1 SEE ALSO

L<Indent(3pm)>,
L<Indent::Comment(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::Form(3pm)>,
L<Indent::PerlStruct(3pm)>,
L<Indent::Tag(3pm)>,
L<Indent::Utils(3pm)>,
L<Indent::Word(3pm)>.

=head1 AUTHOR

 Michal Špaček F<tupinek@gmail.com>

=head1 LICENSE AND COPYRIGHT

 BSD License.

=head1 VERSION

 0.01

=cut
