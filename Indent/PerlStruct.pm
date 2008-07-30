#------------------------------------------------------------------------------
package Indent::PerlStruct;
#------------------------------------------------------------------------------
# $Id: PerlStruct.pm,v 1.13 2008-07-30 14:52:37 skim Exp $

# Pragmas.
use strict;

# Modules.
use Error::Simple::Multiple;
use Indent;

# Version.
our $VERSION = 0.01;

#------------------------------------------------------------------------------
sub new($@) {
#------------------------------------------------------------------------------
# Constructor.

	my $class = shift;
	my $self = bless {}, $class;

	# Every next indent string.
	$self->{'next_indent'} = "\t";

	# Output separator.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@_) {
		my $key = shift;
		my $val = shift;
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
sub indent($$;$$) {
#------------------------------------------------------------------------------
# Get indented structure.

	my ($self, $data, $comma_flag, $indent_flag) = @_;
	$comma_flag = 0 unless $comma_flag;
	$indent_flag = 1 unless defined $indent_flag;
	my $ret;
	my $indent = $indent_flag ? $self->{'indent'}->get : '';
	if (ref $data eq 'ARRAY') {
		$ret .= $indent.'[';
		if ($#{$data} > -1) {
			$ret .= $self->{'output_separator'};
			$self->{'indent'}->add;
			foreach (@{$data}) {
				$ret .= $self->indent($_, 1);
			}
			$self->{'indent'}->remove;
			$ret .= $self->{'indent'}->get;
		}
		$ret .= '],'.$self->{'output_separator'};
	} elsif (ref $data eq 'HASH') {
		$ret .= $indent.'{';
		if (scalar keys %{$data} > 0) {
			$ret .= $self->{'output_separator'};
			$self->{'indent'}->add;
			foreach my $key (sort keys %{$data}) {
				$ret .= $self->{'indent'}->get._get($key).
					' => '.
					$self->indent($data->{$key}, 1, 0);
			}
			$self->{'indent'}->remove;
			$ret .= $self->{'indent'}->get;
		}
		$ret .= '},'.$self->{'output_separator'};
	} elsif (ref $data eq '') {
		my $comma = $comma_flag ? ',' : '';
		$ret .= $indent._get($data).$comma.$self->{'output_separator'};
	} elsif (ref $data eq 'SCALAR') {
		my $comma = $comma_flag ? ',' : '';
		$ret .= $indent.'\\'._get(${$data}).$comma.
			$self->{'output_separator'};
	}
	return $ret;
}

#------------------------------------------------------------------------------
# Internal subroutines.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
sub _get($) {
#------------------------------------------------------------------------------
# Get variable as serialize.

	my $value = shift;
	if (! defined $value) {
		return 'undef';
	} else {
		$value =~ s/'/\\'/g;
		return '\''.$value.'\'';
	}
}

1;

=pod

=head1 NAME

 Indent::PerlStruct - Class for perl structure indent.

=head1 SYNOPSIS

 use Indent::PerlStruct;
 my $i = Indent::PerlStruct->new(%parameters);
 print $i->indent($data, [$comma_flag, $indent_flag]);

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=over 8

=item * next_indent

 Sets next indent string.
 Default value is 'next_indent' => "\t" (tabelator).

=item * output_separator

 Sets output separator between indented datas for string context.
 Default value is 'output_separator' => "\n" (new line).

=back

=item B<indent($data, [$comma_flag, $indent_flag])>

 Gets indented structure.
 $data - Perl data structure.
 $comma_flag - TODO (Default 0.)
 $indent_flag - TODO (Default 1.)

=back

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

=head1 REQUIREMENTS

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

=head1 VERSION

 0.01

=cut
