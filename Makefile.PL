# $Id: Makefile.PL,v 1.2 2005-02-14 04:06:33 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'VERSION_FROM' => 'Indent.pm',
	'PREREQ_PM' => {},
);
