package Indent::Word;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use English qw(-no_match_vars);
use Error::Pure qw(err);
use Indent::Utils qw(line_size_check);
use Readonly;

# Constants.
Readonly::Scalar my $EMPTY_STR => q{};
Readonly::Scalar my $LINE_SIZE => 79;

# Version.
our $VERSION = 0.04;

# Constructor.
sub new {
	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Use with ANSI sequences.
	$self->{'ansi'} = 0;

	# Options.
	$self->{'line_size'} = $LINE_SIZE;
	$self->{'next_indent'} = "\t";

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	set_params($self, @params);

	# 'line_size' check.
	line_size_check($self);

	# Check rutine for removing ANSI sequences.
	if ($self->{'ansi'}) {
		eval {
			require Text::ANSI::Util;
		};
		if ($EVAL_ERROR) {
			err "Cannot load 'Text::ANSI::Util' module.";
		}
	}

	# Object.
	return $self;
}

# Indent text by words to line_size block size.
sub indent {
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
	while ($self->_length($second) >= $self->{'line_size'}
		&& $second =~ /^\s*\S+\s+/ms
		&& $last_second_length != $self->_length($second)) {

		# Last length of non-parsed part of data.
		$last_second_length = $self->_length($second);

		# Parse to indent length.
		($first, my $tmp) = $second
			=~ /^(.{0,$self->{'line_size'}})\s+(.*)$/msx;

		# If string is non-breakable in indent length, than parse to
		# blank char.
		if (! $first
			|| $self->_length($first) < $self->_length($indent)
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
	$second =~ s/\s+$//ms;
	if ($second) {
		push @data, $second;
	}

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

# Get length.
sub _length {
	my ($self, $string) = @_;
	if ($self->{'ansi'}) {
		return length Text::ANSI::Util::ta_strip($string);
	} else {
		return length $string;
	}
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

 Indent::Word - Class for word indenting.

=head1 SYNOPSIS

 use Indent::Word;
 my $indent = Indent::Word->new(%parameters);
 $indent->indent('text text text');

=head1 METHODS

=over 8

=item C<new(%parameters)>

 Constructor.

=over 8

=item * C<ansi>

 Use with ANSI sequences.
 Default value is 0.

=item * C<line_size>

 Sets indent line size value.
 Default value is 79.

=item * C<next_indent>

 Sets output separator between indented datas for string context.
 Default value is "\t" (tabelator).

=item * C<output_separator>

 Output separator between data in scalar context.
 Default value is "\n" (new line).

=back

=item C<indent($data, [$indent, $non_indent])>

 Indent text by words to line_size block size.
 $act_indent - Actual indent string. Will be in each output string.
 $non_indent - Is flag for non indenting. Default is 0.

=back

=head1 ERRORS

 new():
         Cannot load 'Text::ANSI::Util' module.
         From Class::Utils::set_params():
                 Unknown parameter '%s'.
         From Indent::Utils::line_size_check():
                 'line_size' parameter must be a positive number.
                         line_size => %s

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

L<Class::Utils>,
L<English>,
L<Error::Pure>,
L<Indent::Utils>,
L<Readonly>.

=head1 SEE ALSO

L<Indent>,
L<Indent::Block>,
L<Indent::Data>,
L<Indent::Utils>.

L<Text::ANSI::Util> for situation with 'ansi' => 1.

=head1 REPOSITORY

L<https://github.com/tupinek/Indent>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.04

=cut
