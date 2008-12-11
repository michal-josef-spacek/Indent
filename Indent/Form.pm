#------------------------------------------------------------------------------
package Indent::Form;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);
use Indent::Word;
use Readonly;

# Constants.
Readonly::Scalar my $EMPTY => q{};
Readonly::Scalar my $LINE_SIZE => 79;
Readonly::Scalar my $SPACE => q{ };

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
	$self->{'right_align'} = 1;
	$self->{'form_separator'} = ': ';
	$self->{'next_indent'} = undef;

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@params) {
		my $key = shift @params;
		my $val = shift @params;
		err "Unknown parameter '$key'." unless exists $self->{$key};
		$self->{$key} = $val;
	}

	# Line_size check.
	if ($self->{'line_size'} !~ /^\d*$/sm) {
		err "Bad line_size = '$self->{'line_size'}'.";
	}

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Indent form data.

	my ($self, $data, $indent, $non_indent) = @_;

	# Undef indent.
	if (! $indent) {
		$indent = $EMPTY;
	}

	# Max size of key.
	my $max = 0;
	my @data;
	foreach my $dat (@{$data}) {
		if (length $dat->[0] > $max) {
			$max = length $dat->[0];
		}

		# Non-indent.
		if ($non_indent) {
			push @data, $dat->[0].$self->{'form_separator'}.
				$dat->[1];
		}
	}

	# If non-indent.
	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data)
		if $non_indent;

	# Indent word.
	my $next_indent = $self->{'next_indent'} ? $self->{'next_indent'}
		: $SPACE x ($max + length $self->{'form_separator'});
	my $word = Indent::Word->new(
		'line_size' => $self->{'line_size'} - $max
			- length $self->{'form_separator'},
		'next_indent' => $next_indent,
	);

	foreach my $dat (@{$data}) {
		my $output = $indent;
		if ($self->{'right_align'}) {
			$output .= $SPACE x ($max - length $dat->[0]);
			$output .= $dat->[0];
		} else {
			$output .= $dat->[0];
			$output .= $SPACE x ($max - length $dat->[0]);
		}
		$output .= $self->{'form_separator'};
		my @tmp = $word->indent($dat->[1]);
		$output .= shift @tmp;
		push @data, $output;
		while (@tmp) {
			push @data, $indent.shift @tmp;
		}
	}

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

 Indent::Form - A perl module for form indenting.

=head1 SYNOPSIS

 use Indent::Form;
 my $indent = Indent::Form->new(%params);
 $indent->indent($data);
 # TODO

=head1 METHODS

=over 8

=item B<new(%params)>

 Constructor.

=over 8

=item * B<form_separator>

 TODO
 Default value of 'form_separator' is ': '.

=item * B<line_size>

 TODO
 Default value of 'line_size' is 79 chars.

=item * B<next_indent>

 TODO
 Default value of 'next_indent' isn't define.

=item * B<output_separator>

 TODO
 Default value of 'output_separator' is new line (\n).

=item * B<right_align>

 TODO
 Default value of 'right_align' is 1.

=back

=item B<indent($data, [$indent, $non_indent])>

 $data - Data array [['key' => 'value'], [..]];
 $indent - String to actual indent.
 $non_indent - Flag, than says no-indent.

=back

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Form;

 # Indent object.
 my $indent = Indent::Form->new(

        # Begin indent.
        'indent' => '->',

        # Next indent.
        'next_indent' => "->"
 );
 $indent->indent();

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Indent::Word(3pm)>,
L<Error::Simple::Multiple(3pm)>

=head1 SEE ALSO

L<Indent(3pm)>,
L<Indent::Block(3pm)>,
L<Indent::Comment(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::PerlStruct(3pm)>,
L<Indent::Tag(3pm)>,
L<Indent::Utils(3pm)>,
L<Indent::Word(3pm)>.

=head1 AUTHOR

 Michal Špaček <F<tupinek@gmail.com>>.

=head1 LICENSE AND COPYRIGHT

 BSD license.

=head1 VERSION

 0.01

=cut
