#------------------------------------------------------------------------------
package Indent::PerlStruct;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);
use Indent;
use Indent::Utils qw(set_params);
use Readonly;
use Scalar::Util qw(blessed);

# Constants.
Readonly::Scalar my $EMPTY_STR => q{};
Readonly::Scalar my $CODE => 'CODE()';
Readonly::Scalar my $COMMA => q{,};

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
	set_params($self, @params);

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
	return $self->_indent($data);
}

#------------------------------------------------------------------------------
# Internal subroutines.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
sub _get {
#------------------------------------------------------------------------------
# Get variable as serialize.

	my ($value, $key_flag) = @_;
	if (! defined $value) {
		return 'undef';
	} else {
		if (int $value eq $value && ! $key_flag) {
			return $value;
		} else {
			$value =~ s/'/\\'/gms;
			return '\''.$value.'\'';
		}
	}
}

#------------------------------------------------------------------------------
sub _indent {
#------------------------------------------------------------------------------
# Get indented structure.

	my ($self, $data_r, $comma_flag, $indent_flag) = @_;
	if (! $comma_flag) {
		$comma_flag = 0;
	}
	if (! defined $indent_flag) {
		$indent_flag = 1;
	}
	my $ret;
	my $indent = $indent_flag ? $self->{'indent'}->get : $EMPTY_STR;
	if (ref $data_r eq 'ARRAY') {
		$ret .= $indent.'[';
		if (scalar @{$data_r}) {
			$ret .= $self->{'output_separator'};
			$self->{'indent'}->add;
			foreach my $sub_data_r (@{$data_r}) {
				$ret .= $self->_indent($sub_data_r, 1);
			}
			$self->{'indent'}->remove;
			$ret .= $self->{'indent'}->get;
		}
		$ret .= '],'.$self->{'output_separator'};
	} elsif (ref $data_r eq 'HASH' || defined blessed $data_r) {
		$ret .= $indent.'{';
		if (scalar keys %{$data_r} > 0) {
			$ret .= $self->{'output_separator'};
			$self->{'indent'}->add;
			foreach my $key (sort keys %{$data_r}) {
				$ret .= $self->{'indent'}->get._get($key, 1).
					' => '.
					$self->_indent($data_r->{$key}, 1, 0);
			}
			$self->{'indent'}->remove;
			$ret .= $self->{'indent'}->get;
		}
		$ret .= '},'.$self->{'output_separator'};
	} elsif (ref $data_r eq $EMPTY_STR) {
		my $comma = $comma_flag ? $COMMA : $EMPTY_STR;
		$ret .= $indent._get($data_r).$comma.$self->{'output_separator'};
	} elsif (ref $data_r eq 'SCALAR') {
		my $comma = $comma_flag ? $COMMA : $EMPTY_STR;
		$ret .= $indent.'\\'._get(${$data_r}).$comma.
			$self->{'output_separator'};
	} elsif (ref $data_r eq 'CODE') {
		my $comma = $comma_flag ? $COMMA : $EMPTY_STR;
		$ret .= $indent.$CODE.$comma.$self->{'output_separator'};
	} else {
		err "Unsupported data.\n";
	}
	return $ret;
}

1;

__END__

=pod

=encoding utf8

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

 Mine:
   Unsupported data.

 From CSS::Structure::Utils:
   Unknown parameter '%s'.

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
L<Indent(3pm)>,
L<Indent::Utils(3pm)>,
L<Readonly(3pm)>,
L<Scalar::Util(3pm)>.

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
