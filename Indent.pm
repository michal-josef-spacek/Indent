package Indent;

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);
use Indent::Utils qw(set_params);
use Readonly;

# Constants.
Readonly::Scalar my $EMPTY_STR => q{};

# Version.
our $VERSION = 0.02;

# Constructor.
sub new {
	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Default indent.
	$self->{'indent'} = $EMPTY_STR;

	# Every next indent string.
	$self->{'next_indent'} = "\t";

	# Process params.
	set_params($self, @params);

	# Check to 'next_indent' parameter.
	if (! defined $self->{'next_indent'}) {
		err "'next_indent' parameter must be defined.";
	}
	if (ref $self->{'next_indent'}) {
		err "'next_indent' parameter must be a string.";
	}

	# Check to 'indent' parameter.
	if (! defined $self->{'indent'}) {
		err "'indent' parameter must be defined.";
	}
	if (ref $self->{'indent'}) {
		err "'indent' parameter must be a string.";
	}

	# Object.
	return $self;
}

# Add an indent to global indent.
sub add {
	my ($self, $indent) = @_;
	if (! defined $indent) {
		$indent = $self->{'next_indent'};
	}
	$self->{'indent'} .= $indent;
	return 1;
}

# Remove an indent from global indent.
sub remove {
	my ($self, $indent) = @_;
	if (! defined $indent) {
		$indent = $self->{'next_indent'};
	}
	my $indent_length = length $indent;
	if (substr($self->{'indent'}, -$indent_length) ne $indent) {
		err "Cannot remove indent '$indent'.";
	}
	$self->{'indent'} = substr $self->{'indent'}, 0, -$indent_length;
	return 1;
}

# Get a indent value.
sub get {
	my $self = shift;
	return $self->{'indent'};
}

# Reseting indent.
sub reset {
	my ($self, $reset_value) = @_;
	if (! defined $reset_value) {
		$reset_value = $EMPTY_STR;
	}
	$self->{'indent'} = $reset_value;
	return 1;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Indent - A perl module for indent handling.

=head1 SYNOPSIS

 use Indent;
 my $indent = Indent->new(%parameters);
 $indent->add([$cur_indent]);
 $indent->get;
 $indent->remove([$cur_indent]);
 $indent->reset([$reset_value]);

=head1 METHODS

=over 8

=item B<new($option =E<gt> $value)>

This is a class method, the constructor for Indent. Options are passed
as keyword value pairs. Recognized options are:

=over 8

=item * B<indent>

 Default indent.
 Default value is ''.

=item * B<next_indent>

 Next indent. Adding to internal indent variable after every add method 
 calling.
 Default value is "\t" (tabelator).

=back

=item B<add([$cur_indent])>

 Method for adding $cur_indent, if defined, or 'next_indent'.

=item B<remove([$cur_indent])>

 Method for removing $cur_indent, if defined, or 'next_indent'. Only if 
 is removable.

=item B<get()>

 Get actual indent string.

=item B<reset([$reset_value])>

 Resets internal indent string to $reset_value or ''.

=back

=head1 ERRORS

 Mine:
   TODO

 From CSS::Structure::Utils:
   Unknown parameter '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent;

 # Indent object.
 my $indent = Indent->new(

        # Begin indent.
        'indent' => '->',

        # Next indent.
        'next_indent' => "->"
 );

 # Print example.
 print $indent->get;
 print "Example\n";

 # Add indent and print ok.
 $indent->add;
 print $indent->get;
 print "Ok\n";

 # Remove indent and print nex example.
 $indent->remove;
 print $indent->get;
 print "Example2\n";

 # Reset.
 $indent->reset;

 Gets: 
 ->Example
 ->->Ok
 ->Example2

=head1 DEPENDENCIES

L<Error::Simple::Multiple(3pm)>,
L<Indent::Utils(3pm)>,
L<Readonly(3pm)>.

=head1 SEE ALSO

L<Indent::Block(3pm)>,
L<Indent::Comment(3pm)>,
L<Indent::Data(3pm)>,
L<Indent::Form(3pm)>,
L<Indent::PerlStruct(3pm)>,
L<Indent::Tag(3pm)>,
L<Indent::Utils(3pm)>,
L<Indent::Word(3pm)>.

=head1 AUTHOR

Michal Špaček <F<tupinek@gmail.com>>

=head1 LICENSE AND COPYRIGHT

BSD licence.

=head1 VERSION

0.02

=cut

