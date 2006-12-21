# $Id: Makefile.PL,v 1.12 2006-12-21 03:08:27 skim Exp $

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
	'VERSION' => 0.01,
);
