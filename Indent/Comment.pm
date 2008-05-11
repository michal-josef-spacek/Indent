#------------------------------------------------------------------------------
package Indent::Comment;
#------------------------------------------------------------------------------
# $Id: Comment.pm,v 1.27 2008-05-11 13:39:13 skim Exp $

# Pragmas.
use strict;

# Modules.
use Error::Simple::Multiple qw(err);

# Version.
our $VERSION = 0.02;

#------------------------------------------------------------------------------
sub new($@) {
#------------------------------------------------------------------------------
# Constructor.
	
	my $class = shift;
	my $self = bless {}, $class;
	
	# Comment type.
	$self->{'begin'} = '';
	$self->{'middle'} = '';
	$self->{'end'} = '';

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
sub indent($) {
#------------------------------------------------------------------------------
# Parses tag to indented data.
# @param $data Data string.

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

=item B<new($option =E<gt> $value)>

 This is a class method, the constructor for Indent. Options are passed
 as keyword value pairs. Recognized options are:

=over 8

=item * begin

 There is a first line comment.
 Default value of 'begin' is ''.

=item * middle

 There is a middle line comment.
 Default value of 'middle' is ''.

=item * end

 There is a last line comment.
 Default value of 'end' is ''.

=item * output_separator

 'indent' method returns string in string content. There are items with
 'output_separator' separator merged to string.
 Default value of 'output_separator' is new line (\n).

=back

=item B<indent($data)>

 Method, which indents data. Return array (in array context) 
 or string with 'output_separator' between datas.
 $data is reference to array with comment data.

=back

=head1 EXAMPLE

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

 Gets:
 /* 
  * text
  * text
  * text
  */

=head1 REQUIREMENTS

L<Error::Simple::Multiple(3pm)>

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

 Michal Spacek <F<tupinek@gmail.com>>.

=head1 VERSION

 0.02

=cut

