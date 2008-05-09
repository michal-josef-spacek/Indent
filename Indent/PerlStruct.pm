#------------------------------------------------------------------------------
package Indent::PerlStruct;
#------------------------------------------------------------------------------
# $Id: PerlStruct.pm,v 1.1 2008-05-09 13:39:07 skim Exp $

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
sub dump($$;$$) {
#------------------------------------------------------------------------------
# Dump.

	my ($self, $data, $comma_flag, $indent_flag) = @_;
	$comma_flag = 0 unless $comma_flag;
	$indent_flag = 1 unless defined $indent_flag;
	my $ret;
	my $indent = $indent_flag ? $self->{'indent'}->get : '';
	if (ref $data eq 'ARRAY') {
		$ret .= $indent.'['.$self->{'output_sep'};
		$self->{'indent'}->add;
		foreach (@{$data}) {
			$ret .= $self->dump($_, 1);
		}
		$self->{'indent'}->remove;
		$ret .=$self->{'indent'}->get.'],'.$self->{'output_sep'};
	} elsif (ref $data eq 'HASH') {
		$ret .= $indent.'{'.$self->{'output_sep'};
		$self->{'indent'}->add;
		foreach my $key (sort keys %{$data}) {
			$ret .= $self->{'indent'}->get.get($key).' => '.
				$self->dump($data->{$key}, 1, 0);
		}
		$self->{'indent'}->remove;
		$ret .= $self->{'indent'}->get.'},'.$self->{'output_sep'};
	} elsif (ref $data eq '') {
		my $comma = $comma_flag ? ',' : '';
		$ret .= $indent.get($data).$comma.$self->{'output_sep'};
	} elsif (ref $data eq 'SCALAR') {
		my $comma = $comma_flag ? ',' : '';
		$ret .= $indent.'\\'.get(${$data}).$comma.
			$self->{'output_sep'};
	}
	return $ret;
}

#------------------------------------------------------------------------------
# Internal subroutines.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
sub get($) {
#------------------------------------------------------------------------------
# Get variable as serialize.

	my $value = shift;
	$value =~ s/'/\\'/g;
	return '\''.$value.'\'';
}

1;
