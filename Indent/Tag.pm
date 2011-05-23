package Indent::Tag;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use Indent::Utils qw(string_len);
use Readonly;
use Tag::Parse qw(parse_normal);

# Constants.
Readonly::Scalar my $EMPTY_STR => q{};
Readonly::Scalar my $LINE_SIZE => 79;
Readonly::Scalar my $SPACE => q{ };

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Options.
	$self->{'line_size'} = $LINE_SIZE;
	$self->{'next_indent'} = "\t";

	# Output.
	$self->{'output_separator'} = "\n";

	# Process params.
	set_params($self, @params);

	# 'line_size' check.
	if ($self->{'line_size'} !~ /^\d*$/ms || $self->{'line_size'} < 0) {
		err '\'line_size\' parameter must be a number.', 
			'line_size', $self->{'line_size'};
	}

	# Object.
	return $self;
}

# Parses tag to indented data.
sub indent {
	my ($self, $tag, $indent, $non_indent) = @_;

	# Undef indent.
	if (! $indent) {
		$indent = $EMPTY_STR;
	}

	# If non_indent data, than return.
	if ($non_indent) {
		return $indent.$tag;
	}

	# Parse tag.
	my $tag_info = parse_normal($tag);

	my @data;
	my ($tmp, $tmp2) = ($EMPTY_STR, $EMPTY_STR);

	# Sorted pairs of attributes.
	my @params;
	foreach (sort keys %{$tag_info->{'attribute'}}) {
		push @params, $_, $tag_info->{'attribute'}->{$_};
	}
	$tag_info->{'end2'} = 1;
	my $one = 0;
	while (exists $tag_info->{'name'}
		|| scalar @params || exists $tag_info->{'end'}
		|| exists $tag_info->{'end2'}) {

		# Tag name.
		if (exists $tag_info->{'name'}) {
			$tmp2 .= '<'.$tag_info->{'name'};
			delete $tag_info->{'name'};

		# Params.
		} elsif (scalar @params) {

			# Param name.
			if (($#params + 1) % 2 == 0) {
				$tmp2 .= $SPACE;
				$tmp2 .= shift @params;

			# '='.
			} elsif (substr($tmp, string_len($tmp) - 1) ne q{=}) {
				$tmp2 .= q{=};

			# Param value.
			} else {
				$tmp2 .= q{"};
				$tmp2 .= shift @params;
				$tmp2 .= q{"};
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
			$tmp2 =~ s/^\s*//ms;
			$tmp = $tmp2;
		}
		$tmp2 = $EMPTY_STR;
	}

	push @data, $indent.$tmp;

	# Return as array or one line with output separator between its.
	return wantarray ? @data : join $self->{'output_separator'}, @data;
}

1;

__END__

=pod

=encoding utf8

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
 Arguments:
 $tag - Tag string.
 $indent - String to actual indent.
 $non_indent - Flag, than says no-indent.

=back

=head1 ERRORS

 Mine:
   TODO

 From Class::Utils::set_params():
   Unknown parameter '%s'.

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

=head1 DEPENDENCIES

L<Class::Utils(3pm)>,
L<Error::Pure(3pm)>,
L<Indent::Utils(3pm)>,
L<Readonly(3pm)>,
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

=head1 AUTHOR

Michal Špaček <F<skim@cpan.org>>.

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
