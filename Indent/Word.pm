#------------------------------------------------------------------------------
package Indent::Word;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);
use Indent::Utils qw(set_params);
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

	# Process params.
	set_params($self, @params);

	# Line_size check.
	if ($self->{'line_size'} !~ /^\d*$/ms) {
		err "Bad line_size = '$self->{'line_size'}'.";
	}

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Indent text by words to line_size block size.

	my ($self, $data, $indent, $non_indent) = @_;

	# 'indent' initialization.
	if (! defined $indent) {
		$indent = $EMPTY_STR;
	}

	# If non_indent data, than return.
	if ($non_indent) {
		return $indent.$data;
	}

	my ($first, $second) = (undef, $indent.$data);
	my $last_second_length = 0;
	my @data;
	my $one = 1;
	while (length $second >= $self->{'line_size'}
		&& $second =~ /^\s*\S+\s+/ms
		&& $last_second_length != length $second) {

		# Last length of non-parsed part of data.
		$last_second_length = length $second;

		# Parse to indent length.
		($first, my $tmp) = $second
			=~ /^(.{0,$self->{'line_size'}})\s+(.*)$/msx;

		# If string is non-breakable in indent length, than parse to
		# blank char.
		if (! $first || length $first < length $indent
			|| $first =~ /^$indent\s*$/ms) {

			($first, $tmp) = $second
				=~ /^($indent\s*[^\s]+?)\s(.*)$/msx;
		}

		# If parsing is right.
		if ($tmp) {

			# Non-parsed part of data.
			$second = $tmp;

			# Add next_indent to string.
			if ($one == 1) {
				$indent .= $self->{'next_indent'};
			}
			$one = 0;
			$second = $indent.$second;

			# Parsed part of data to @data array.
			push @data, $first;
		}
	}

	# Add other data to @data array.
	if ($second || $second !~ /^\s*$/ms) {
		push @data, $second;
	}

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

 Indent::Word - Indent class for normal texts.

=head1 SYNOPSIS

 use Indent::Word;
 my $indent = Indent::Word->new(%parameters);
 $indent->indent('text text text');

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=over 8

=item * B<line_size>

 Sets indent line size value.
 Default value is 79.

=item * B<next_indent>

 Sets output separator between indented datas for string context.
 Default value is "\t" (tabelator).

=item * B<output_separator>

 Output separator between data in scalar context.
 Default value is "\n" (new line).

=back

=item B<indent($data, [$indent, $non_indent])>

 Indent text by words to line_size block size.
 $act_indent - Actual indent string. Will be in each output string.
 $non_indent - Is flag for non indenting. Default is 0.

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
 use Indent::Word;

 # Object.
 my $i = Indent::Word->new(
         'line_size' => 20,
 );

 # Indent.
 print $i->indent(join(' ', ('text') x 7))."\n";

 # Output:
 # text text text text
 # <--tab->text text text

=head1 DEPENDENCIES

L<Error::Simple::Multiple(3pm)>,
L<Indent::Utils(3pm)>,
L<Readonly(3pm)>.

=head1 SEE ALSO

L<Indent(3pm)>,
L<Indent::Block(3pm)>,
L<Indent::Comment(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::Form(3pm)>,
L<Indent::PerlStruct(3pm)>,
L<Indent::Tag(3pm)>,
L<Indent::Utils(3pm)>.

=head1 AUTHOR

Michal Špaček L<tupinek@gmail.com>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
