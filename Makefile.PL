# $Id: Makefile.PL,v 1.1 2005-02-14 03:51:10 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indenter',
	'VERSION_FROM' => 'Indenter/Indent.pm',
	'PREREQ_PM' => {},
);
