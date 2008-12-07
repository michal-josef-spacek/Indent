#------------------------------------------------------------------------------
package Indent::PerlStruct;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple;
use Indent;
use Readonly;
use Scalar::Util qw(blessed);

# Constants.
Readonly::Scalar my $EMPTY => q{};

# Version.
our $VERSION = 0.03;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.

	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Every next indent string.
	$self->{'next_indent'} = "\t";

	# Output separator.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@params) {
		my $key = shift @params;
		my $val = shift @params;
		err "Unknown parameter '$key'." unless exists $self->{$key};
		$self->{$key} = $val;
	}

	# Indent object.
	$self->{'indent'} = Indent->new(
		'next_indent' => $self->{'next_indent'},
	);

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Get indented structure.

	my ($self, $data) = @_;
	$self->_indent($data);
	return;
}

#------------------------------------------------------------------------------
# Internal subroutines.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
sub _get {
#------------------------------------------------------------------------------
# Get variable as serialize.

	my $value = shift;
	if (! defined $value) {
		return 'undef';
	} else {
		$value =~ s/'/\\'/gsm;
		return '\''.$value.'\'';
	}
}

#------------------------------------------------------------------------------
sub _indent {
#------------------------------------------------------------------------------
# Get indented structure.

	my ($self, $data, $comma_flag, $indent_flag) = @_;
	$comma_flag = 0 unless $comma_flag;
	$indent_flag = 1 unless defined $indent_flag;
	my $ret;
	my $indent = $indent_flag ? $self->{'indent'}->get : $EMPTY;
	if (ref $data eq 'ARRAY') {
		$ret .= $indent.'[';
		if (scalar @{$data}) {
			$ret .= $self->{'output_separator'};
			$self->{'indent'}->add;
			foreach (@{$data}) {
				$ret .= $self->_indent($_, 1);
			}
			$self->{'indent'}->remove;
			$ret .= $self->{'indent'}->get;
		}
		$ret .= '],'.$self->{'output_separator'};
	} elsif (ref $data eq 'HASH' || defined blessed $data) {
		$ret .= $indent.'{';
		if (scalar keys %{$data} > 0) {
			$ret .= $self->{'output_separator'};
			$self->{'indent'}->add;
			foreach my $key (sort keys %{$data}) {
				$ret .= $self->{'indent'}->get._get($key).
					' => '.
					$self->_indent($data->{$key}, 1, 0);
			}
			$self->{'indent'}->remove;
			$ret .= $self->{'indent'}->get;
		}
		$ret .= '},'.$self->{'output_separator'};
	} elsif (ref $data eq $EMPTY) {
		my $comma = $comma_flag ? ',' : $EMPTY;
		$ret .= $indent._get($data).$comma.$self->{'output_separator'};
	} elsif (ref $data eq 'SCALAR') {
		my $comma = $comma_flag ? ',' : $EMPTY;
		$ret .= $indent.'\\'._get(${$data}).$comma.
			$self->{'output_separator'};
	} else {
		err "Unsupported data.\n";
	}
	return $ret;
}

1;

__END__

=pod

=head1 NAME

 Indent::PerlStruct - Class for perl structure indent.

=head1 SYNOPSIS

 use Indent::PerlStruct;
 my $i = Indent::PerlStruct->new(%parameters);
 print $i->indent($data);

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=over 8

=item * B<next_indent>

 Sets next indent string.
 Default value is 'next_indent' => "\t" (tabelator).

=item * B<output_separator>

 Sets output separator between indented datas for string context.
 Default value is 'output_separator' => "\n" (new line).

=back

=item B<indent($data)>

 Gets indented structure.
 $data - Perl data structure.

=back

=head1 ERRORS

 Unknown parameter '%'.
 Unsupported data.

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::PerlStruct;

 # Object.
 my $indent = Indent::PerlStruct->new(
         'next_indent' => '',
         'output_separator' => '',
 );
 print $indent->indent([[1, 2], [3], 'dd'])."\n";

 # OUTPUT:
 # [['1','2',],['3',],'dd',],

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::PerlStruct;

 # Object.
 my $indent = Indent::PerlStruct->new;
 print $indent->indent([[1, 2], [3], 'dd'])."\n";

 # OUTPUT:
 # [
 #       [
 #               '1',
 #               '2',
 #       ],
 #       [
 #               '3',
 #       ],
 #       'dd',
 # ],

=head1 DEPENDENCIES

L<Error::Simple::Multiple(3pm)>,
L<Indent(3pm)>.

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

 BSD license.

=head1 VERSION

 0.03

=cut
