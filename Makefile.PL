# $Id: Makefile.PL,v 1.13 2007-01-24 22:36:34 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Spacek',
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.02,
		'Tag::Parse' => 0.03,
	},
	'VERSION' => 0.02,
);
