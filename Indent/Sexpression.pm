package Indent::Sexpression;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Error::Simple::Multiple qw(err);
use Indent;
use Readonly;

# Constants.
Readonly::Scalar my $EMPTY_STR => qw{};

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
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

# Get indented structure.
sub indent {
	my ($self, $data) = @_;
	return $self->_indent($data);
}

# Indent data to output.
sub _indent {
	my ($self, @data) = @_;
	my $ret;
	my $num = 0;
	my $indent_flag = 0;
	foreach my $data (@data) {
		if (ref $data eq 'ARRAY') {
			$self->{'indent'}->add;
			$ret .= $self->{'output_separator'};
			$ret .= $self->_indent(@{$data});
			$self->{'indent'}->remove;
		} elsif (! ref $data || ref $data eq $EMPTY_STR) {
			if ($num == 0) {
				$ret .= $self->{'indent'}->get.'('.$data;
				$indent_flag = 1;
			} else {
				$ret .= ' "'.$data.'"';
			}
		} else {
			err 'Unsupported data.';
		}
		$num++;
	}
	if ($indent_flag == 1) {
		$ret .= ")";
	}
	return $ret;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

 Indent::Sexpression - Class for perl structure indent.

=head1 SYNOPSIS

 use Indent::Sexpression;
 my $i = Indent::Sexpression->new(%parameters);
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

 From Class::Utils::set_params():
   Unknown parameter '%s'.

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Sexpression;

 # Object.
 my $indent = Indent::Sexpression->new(
         'next_indent' => '',
         'output_separator' => '',
 );
 print $indent->indent([[1, 2], [3], 'dd'])."\n";

 # OUTPUT:
 # TODO

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Sexpression;

 # Object.
 my $indent = Indent::Sexpression->new;
 print $indent->indent([[1, 2], [3], 'dd'])."\n";

 # OUTPUT:
 # TODO

=head1 DEPENDENCIES

L<Class::Utils(3pm)>,
L<Error::Simple::Multiple(3pm)>,
L<Indent(3pm)>,
L<Readonly(3pm)>.

=head1 SEE ALSO

L<Indent(3pm)>,
L<Indent::Comment(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::Form(3pm)>,
L<Indent::PerlIndent(3pm)>,
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
