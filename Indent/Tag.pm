#------------------------------------------------------------------------------
package Indent::Tag2;
#------------------------------------------------------------------------------
# $Id: Tag.pm,v 1.24 2005-09-26 17:49:05 skim Exp $

# Pragmas.
use strict;

# Modules.
use Error::Simple qw(err);
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
		err "Unknown parameter '$key'." if ! exists $self->{$key};
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
				$tmp2 .= ' /';
			}
			delete $tag_info->{'end'};

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

=head1 NAME

Indent::Tag - A perl module for tag indenting.

=head1 SYNOPSIS

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
 $indent_tag->indent;

=head1 DESCRIPTION

TODO

=head1 METHODS

=over 4

=item new

This is a class method, the constructor for Indent::Tag. Options are passed
as keyword value pairs. Recognized options are:

=over 4

=item * line_size

Default value of 'line_size' is 79 chars. 
TODO

=item * next_indent

Default value of 'next_indent' is tabelator (\t). 
TODO

=item * output_separator

Default value of 'output_separator' is new line (\n).
TODO

=back

=item indent

TODO

=head1 AUTHORS

Michal Spacek <F<skim@skim.cz>> wrote version 0.1.

=cut
