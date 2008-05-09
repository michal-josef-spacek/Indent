#------------------------------------------------------------------------------
package Indent::PerlStruct;
#------------------------------------------------------------------------------
# $Id: PerlStruct.pm,v 1.4 2008-05-09 13:58:38 skim Exp $

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

	# Default indent.
	$self->{'indent'} = '';

	# Every next indent string.
	$self->{'next_indent'} = "\t";

	# Output separator.
	$self->{'output_sep'} = "\n";

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
		$ret .= $indent.'['.$self->{'output_sep'};
		$self->{'indent'}->add;
		foreach (@{$data}) {
			$ret .= $self->indent($_, 1);
		}
		$self->{'indent'}->remove;
		$ret .=$self->{'indent'}->get.'],'.$self->{'output_sep'};
	} elsif (ref $data eq 'HASH') {
		$ret .= $indent.'{'.$self->{'output_sep'};
		$self->{'indent'}->add;
		foreach my $key (sort keys %{$data}) {
			$ret .= $self->{'indent'}->get._get($key).' => '.
				$self->indent($data->{$key}, 1, 0);
		}
		$self->{'indent'}->remove;
		$ret .= $self->{'indent'}->get.'},'.$self->{'output_sep'};
	} elsif (ref $data eq '') {
		my $comma = $comma_flag ? ',' : '';
		$ret .= $indent._get($data).$comma.$self->{'output_sep'};
	} elsif (ref $data eq 'SCALAR') {
		my $comma = $comma_flag ? ',' : '';
		$ret .= $indent.'\\'._get(${$data}).$comma.
			$self->{'output_sep'};
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
	$value =~ s/'/\\'/g;
	return '\''.$value.'\'';
}

1;

=pod

=head1 NAME

 Indent::PerlStruct - Class for perl structure indent.

=head1 SYNOPSIS

 use Indent::PerlStruct;
 my $i = Indent::PerlStruct->new(%parameters);
 print $i->indent($data, [$indent, $non_indent]);

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=head2 PARAMETERS

=over 8

=item B<indent>

 Default value is ''.

=item B<next_indent>

 Sets next indent string.
 Default value is 'next_indent' => "\t" (tabelator).

=item B<output_sep>

 Sets output separator between indented datas for string context.
 Default value is 'output_sep' => "\n" (new line).

=back

=item B<indent($data, [$comma_flag, $indent_flag])>

 TODO

=back

=head1 EXAMPLE

 TODO

=head1 REQUIREMENTS

L<Error::Simple::Multiple(3)>,
L<Indent(3)>.

=head1 SEE ALSO

L<Indent>,
L<Indent::Comment>,
L<Indent::Data>,
L<Indent::Form>,
L<Indent::PerlStruct>,
L<Indent::Tag>,
L<Indent::Utils>,
L<Indent::Word>.

=head1 AUTHOR

 Michal Špaček F<tupinek@gmail.com>

=head1 VERSION

 0.01

=cut
