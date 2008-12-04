#------------------------------------------------------------------------------
package Indent::Comment;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);
use Indent::Word;

# Version.
our $VERSION = 0.03;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.
	
	my $class = shift;
	my $self = bless {}, $class;
	
	# Comment type.
	$self->{'begin'} = '';
	$self->{'middle'} = '';
	$self->{'end'} = '';

	# Line size.
	$self->{'line_size'} = 79;

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@_) {
		my $key = shift;
		my $val = shift;
		err "Unknown parameter '$key'." unless exists $self->{$key};
		$self->{$key} = $val;
	}

	# Control.
	unless ($self->{'begin'} || $self->{'end'} || $self->{'middle'}) {
		err "Cannot define comments.";
	}

	# Comment tag is one.
	$self->{'one'} = 0;
	if (! $self->{'begin'} && ! $self->{'end'} && $self->{'middle'}) {
		$self->{'one'} = 1;
	}

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Parses tag to indented data.
# @param $data Data string.

	my ($self, $data) = @_;

	# Array of comment texts.
	if (ref $data eq 'ARRAY') {
		return $self->_indent($data);

	# Only text, which will be indented.
	} else {
		# Control for data.
		if (! $data || $data eq '') {
			err "Cannot define data.";
		}

		# Indenter for text.
		my $i_w = Indent::Word->new(
			'line_size' => $self->{'line_size'} 
				- $self->_get_max_len,
			'next_indent' => '',
		);

		# Indent text.
		my @data = $i_w->indent($data);

		# Indent comment.
		return $self->_indent(\@data);
	}
}

#------------------------------------------------------------------------------
# Internal methods.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
sub _get_max_len {
#------------------------------------------------------------------------------
# Get maximal length of comment separators.

	my $self = shift;
	my $max = 0;
	if (exists $self->{'begin'} && length $self->{'begin'} > $max) {
		$max = length $self->{'begin'};
	}
	if (exists $self->{'middle'} && length $self->{'middle'} > $max) {
		$max = length $self->{'middle'};
	}
	if (exists $self->{'end'} && length $self->{'end'} > $max) {
		$max = length $self->{'end'};
	}
	return $max;
}

#------------------------------------------------------------------------------
sub _indent {
#------------------------------------------------------------------------------
# Indent comment data.

	my ($self, $data) = @_;

	# Control for data.
	if (ref $data ne 'ARRAY' || $#{$data} == -1) {
		err "Cannot define data.";
	}

	# Adding comments.
	my @data;
	if (! $self->{'one'}) {
		push @data, $self->{'begin'};
	}
	foreach (@{$data}) {
		push @data, $self->{'middle'}.$_;
	}
	if (! $self->{'one'}) {
		push @data, $self->{'end'};
	}

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

1;

__END__

=pod

=head1 NAME

 Indent::Comment - A perl module for comment indenting.

=head1 SYNOPSIS

 use Indent::Comment;
 my $indent_comment = Indent::Comment->new(
        'begin' => '/*',
        'middle' => ' * ',
        'end' => ' */',
 );
 my $output = $indent_comment->indent([
        'text',
        'text',
        'text'
 ]);
 print "$output\n";

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=over 8

=item * B<begin>

 There is a first line comment.
 Default value of 'begin' is ''.

=item * B<end>

 There is a last line comment.
 Default value of 'end' is ''.

=item * B<line_size>

 Sets indent line size value.
 Default value is 79.

=item * B<middle>

 There is a middle line comment.
 Default value of 'middle' is ''.

=item * B<output_separator>

 'indent' method returns string in string content. There are items with
 'output_separator' separator merged to string.
 Default value of 'output_separator' is new line (\n).

=back

=item B<indent($data)>

 Method, which indents data. Return array (in array context) 
 or string with 'output_separator' between datas.
 $data is reference to array with comment data or text, which will be indented.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Comment;

 # Indent::Comment object.
 my $indent_comment = Indent::Comment->new(
        'begin' => '/*',
        'middle' => ' * ',
        'end' => ' */',
 );

 # Print comment.
 my $output = $indent_comment->indent([
        'text',
        'text',
        'text'
 ]);
 print "$output\n";

 # Output:
 # /* 
 #  * text
 #  * text
 #  * text
 #  */

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Comment;

 # Indent::Comment object.
 my $indent_comment = Indent::Comment->new(
        'begin' => '/*',
        'end' => ' */',
	'line_size' => 23,
        'middle' => ' * ',
 );

 # Print comment.
 my $output = $indent_comment->indent(join(' ', ('text') x 7));
 print "$output\n";

 # Output:
 # /*
 #  * text text text text
 #  * text text text
 #  */

=head1 REQUIREMENTS

L<Error::Simple::Multiple(3pm)>,
L<Indent::Word(3pm)>.

=head1 SEE ALSO

L<Indent(3pm)>,
L<Indent::Block(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::Form(3pm)>,
L<Indent::PerlStruct(3pm)>,
L<Indent::Tag(3pm)>,
L<Indent::Utils(3pm)>,
L<Indent::Word(3pm)>.

=head1 AUTHORS

 Michal Špaček <F<tupinek@gmail.com>>.

=head1 VERSION

 0.03

=cut

