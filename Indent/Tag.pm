#------------------------------------------------------------------------------
package Indent::Tag;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);
use Indent::Utils qw(string_len);
use Tag::Parse qw(parse_normal);

# Version.
our $VERSION = 0.01;

#------------------------------------------------------------------------------
sub new {
#------------------------------------------------------------------------------
# Constructor.

	my $class = shift;
	my $self = bless {}, $class;

	# Options.
	$self->{'line_size'} = 79;
	$self->{'next_indent'} = "\t";

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	while (@_) {
		my $key = shift;
		my $val = shift;
		err "Unknown parameter '$key'." unless exists $self->{$key};
		$self->{$key} = $val;
	}

	# Line_size check.
	if ($self->{'line_size'} !~ /^\d*$/) {
		err "Bad line_size = '$self->{'line_size'}'.";
	}

	# Object.
	return $self;
}

#------------------------------------------------------------------------------
sub indent {
#------------------------------------------------------------------------------
# Parses tag to indented data.
# @param $tag Tag string.
# @param $indent String to actual indent.
# @param $non_indent Flag, than says no-indent.

	my ($self, $tag, $indent, $non_indent) = @_;

	# Undef indent.
	if (! $indent) {
		$indent = '';
	}

	# If non_indent data, than return.
	return $indent.$tag if $non_indent;

	# Parse tag.
	my $tag_info = parse_normal($tag);

	my @data;
	my ($tmp, $tmp2) = ('', '');

	# Sorted pairs of attributes.
	my @params;
	foreach (sort keys %{$tag_info->{'attribute'}}) {
		push @params, $_, $tag_info->{'attribute'}->{$_};
	}
	$tag_info->{'end2'} = 1;
	my $one = 0;
	while (exists $tag_info->{'name'}
		|| $#params > -1 || exists $tag_info->{'end'}
		|| exists $tag_info->{'end2'}) {

		# Tag name.
		if (exists $tag_info->{'name'}) {
			$tmp2 .= "<".$tag_info->{'name'};
			delete $tag_info->{'name'};

		# Params.
		} elsif ($#params > -1) {

			# Param name.
			if (($#params + 1) % 2 == 0) {
				$tmp2 .= ' ';
				$tmp2 .= shift @params;

			# '='.
			} elsif (substr($tmp, string_len($tmp) - 1) ne '=') {
				$tmp2 .= '=';

			# Param value.
			} else {
				$tmp2 .= '"';
				$tmp2 .= shift @params;
				$tmp2 .= '"';
			}

		# End of tag.
		} elsif (exists $tag_info->{'end'}) {
			if ($tag_info->{'end'} == 1) {
				$tmp2 .= ' />';
			}
			delete $tag_info->{'end'};
			if (exists $tag_info->{'end2'}) {
				delete $tag_info->{'end2'};
			}

		# End of tag.
		} elsif (exists $tag_info->{'end2'}) {

			$tmp2 .= '>';
			delete $tag_info->{'end2'};
		}

		# Add to string.
		if (string_len($indent.$tmp.$tmp2) <= $self->{'line_size'}) {
			$tmp .= $tmp2;

		# Add to data.
		} else {
			if ($tmp) {
				push @data, $indent.$tmp;

				# Indent on second and more.
				if ($one == 0) {
					$one = 1;
					$indent .= $self->{'next_indent'};
				}
			}
			$tmp2 =~ s/^\s*//;
			$tmp = $tmp2;
		}
		$tmp2 = '';
	}

	push @data, $indent.$tmp;

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join($self->{'output_separator'}, @data);
}

1;

__END__

=pod

=head1 NAME

 Indent::Tag - TODO

=head1 SYNOPSIS

 TODO

=head1 DESCRIPTION

 A perl module for tag indenting.

=head1 METHODS

=over 8

=item B<new(%parameters)>

 This is a class method, the constructor for Indent::Tag. Options are passed
 as keyword value pairs. Recognized options are:

=over 8

=item * line_size

 TODO
 Default value of 'line_size' is 79 chars.

=item * next_indent

 TODO
 Default value of 'next_indent' is tabelator (\t).

=item * output_separator

 TODO
 Default value of 'output_separator' is new line (\n).

=back

=item B<indent($tag, [$indent, $non_indent])>

 TODO

=back

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent::Tag;

 # Indent::Tag object.
 my $indent_tag = Indent::Tag->new(

        # Line size.
        'line_size' => 20,

        # Next indent.
        'next_indent' => "->",

        # Output separator.
        'output_separator' => "\n"
 );

 my $tag = '<tag param="value"></tag>

 # Indent!
 # TODO?
 $indent_tag->indent($tag);

=head1 REQUIREMENTS

L<Error::Simple::Multiple(3pm)>,
L<Indent::Utils(3pm)>,
L<Tag::Parse(3pm)>.

=head1 SEE ALSO

L<Indent(3pm)>,
L<Indent::Block(3pm)>,
L<Indent::Comment(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::Form(3pm)>,
L<Indent::PerlStruct(3pm)>,
L<Indent::Utils(3pm)>,
L<Indent::Word(3pm)>.

=head1 AUTHORS

 Michal Špaček <F<tupinek@gmail.com>>.

=head1 VERSION

 0.01

=cut
