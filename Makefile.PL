# $Id: Makefile.PL,v 1.4 2005-04-02 15:56:51 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'VERSION_FROM' => 'Indent.pm',
	'PREREQ_PM' => {},
);
