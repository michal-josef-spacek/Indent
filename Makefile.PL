# $Id: Makefile.PL,v 1.3 2005-04-01 11:57:56 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'VERSION_FROM' => 'lib/Indent.pm',
	'PREREQ_PM' => {},
);
